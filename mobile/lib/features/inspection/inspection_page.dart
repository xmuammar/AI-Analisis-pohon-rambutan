import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ai/vision/image_quality_engine.dart';
import '../../data/database/app_database.dart';
import '../../features/camera/guided_camera_page.dart';
import '../../storage/photo_storage.dart';

enum InspectionMode { photoFirst, manual, hybrid }

extension InspectionModeDatabaseValue on InspectionMode {
  String get databaseValue => switch (this) {
        InspectionMode.photoFirst => 'PHOTO_FIRST',
        InspectionMode.manual => 'MANUAL',
        InspectionMode.hybrid => 'HYBRID',
      };
}

class InspectionPage extends ConsumerStatefulWidget {
  const InspectionPage({required this.treeId, super.key});

  final int treeId;

  @override
  ConsumerState<InspectionPage> createState() => _InspectionPageState();
}

class _InspectionPageState extends ConsumerState<InspectionPage> {
  InspectionMode _mode = InspectionMode.photoFirst;
  int _currentStep = 0;
  bool _saving = false;
  bool _capturing = false;
  InspectionDraft? _draft;
  final List<PhotoQualityAssessment?> _photoQuality =
      List<PhotoQualityAssessment?>.filled(6, null);
  final _notesController = TextEditingController();

  static const _steps = [
    ('Pohon Penuh', 'Pastikan pangkal dan pucuk terlihat.'),
    ('Daun / Tajuk', 'Ambil daun yang mewakili kondisi umum pohon.'),
    ('Batang / Pangkal', 'Ambil batang utama dengan jelas.'),
    ('Tanah / Zona Akar', 'Ambil tanah sekitar zona akar.'),
    ('Bunga', 'Ambil foto bunga jika ada.'),
    ('Buah', 'Ambil foto buah jika ada.'),
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = _steps[_currentStep];
    return Scaffold(
      appBar: AppBar(title: const Text('Pemeriksaan Terpandu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SegmentedButton<InspectionMode>(
            segments: const [
              ButtonSegment(
                value: InspectionMode.photoFirst,
                label: Text('Foto'),
              ),
              ButtonSegment(
                value: InspectionMode.hybrid,
                label: Text('Hybrid'),
              ),
              ButtonSegment(
                value: InspectionMode.manual,
                label: Text('Manual'),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (value) => setState(() => _mode = value.single),
          ),
          const SizedBox(height: 24),
          if (_mode != InspectionMode.manual) ...[
            Text(
              '${_currentStep + 1} dari ${_steps.length}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Text(step.$1, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(step.$2),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      _photoQuality[_currentStep] == null
                          ? Icons.camera_alt_outlined
                          : Icons.check_circle_outline,
                      size: 36,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _photoQuality[_currentStep] == null
                          ? 'Ambil foto untuk langkah ini.'
                          : 'Foto tersimpan secara privat di perangkat.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _photoQuality[_currentStep] == null
                          ? 'Kualitas teknis foto akan diperiksa setelah pengambilan. Model analisis visual belum terpasang, sehingga aplikasi tidak membuat hasil AI.'
                          : _qualityMessage(_photoQuality[_currentStep]!),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _capturing ? null : _takePhoto,
                      icon: _capturing
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.camera_alt_outlined),
                      label: Text(
                        _capturing
                            ? 'Menyimpan foto...'
                            : _photoQuality[_currentStep] == null
                                ? 'Buka Kamera'
                                : 'Ambil Foto Ulang',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: _currentStep == 0
                      ? null
                      : () => setState(() => _currentStep--),
                  child: const Text('Kembali'),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: _currentStep == _steps.length - 1
                      ? null
                      : () => setState(() => _currentStep++),
                  child: const Text('Lewati'),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Text(
            'Catatan opsional',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Tambahkan kondisi yang Anda amati.',
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _saving ? null : _saveInspection,
            child: Text(_saving ? 'Menyimpan...' : 'Simpan Pemeriksaan'),
          ),
        ],
      ),
    );
  }

  Future<void> _takePhoto() async {
    final step = _steps[_currentStep];
    final photoPath = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => GuidedCameraPage(title: step.$1, guidance: step.$2),
      ),
    );
    if (photoPath == null || !mounted) return;

    setState(() => _capturing = true);
    try {
      final database = ref.read(databaseProvider);
      final draft = _draft ??
          await database.startInspectionDraft(
            treeId: widget.treeId,
            inspectionMode: _mode.databaseValue,
          );
      final storedPhoto = await PhotoStorage().store(
        sourcePath: photoPath,
        treeId: widget.treeId,
        captureType: _captureTypeForStep(_currentStep),
      );
      final quality =
          await const ImageQualityEngine().assessFile(storedPhoto.path);
      await database.recordPhoto(
        captureSessionId: draft.captureSessionId,
        captureType: _captureTypeForStep(_currentStep),
        filePath: storedPhoto.path,
        checksum: storedPhoto.checksum,
        qualityStatus: quality.status.databaseValue,
        qualityReasons:
            quality.reasons.isEmpty ? null : quality.databaseReasons,
        widthPx: quality.metrics.widthPx,
        heightPx: quality.metrics.heightPx,
      );
      if (!mounted) return;
      setState(() {
        _draft = draft;
        _photoQuality[_currentStep] = quality;
      });
      if (quality.status != PhotoQualityStatus.good) {
        await _showQualityWarning(quality);
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Foto belum dapat disimpan. Tidak ada foto yang dihapus. Silakan coba kembali.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  String _captureTypeForStep(int step) => switch (step) {
        0 => 'FULL_TREE',
        1 => 'LEAF_CANOPY',
        2 => 'TRUNK_BASE',
        3 => 'SOIL_ROOT_ZONE',
        4 => 'FLOWER',
        5 => 'FRUIT',
        _ => throw ArgumentError.value(step, 'step'),
      };

  String _qualityMessage(PhotoQualityAssessment quality) =>
      switch (quality.status) {
        PhotoQualityStatus.good =>
          'Kualitas foto baik untuk diproses saat model analisis tersedia. Foto asli tetap tersimpan privat.',
        PhotoQualityStatus.acceptable =>
          'Foto tersimpan. ${quality.reasons.join(' ')} Anda dapat mengambil ulang untuk hasil lebih baik.',
        PhotoQualityStatus.poor =>
          'Foto tersimpan sebagai raw data, tetapi kualitasnya rendah. ${quality.reasons.join(' ')} Ambil ulang sebelum analisis.',
        PhotoQualityStatus.retakeRequired =>
          'Foto tersimpan sebagai raw data, namun perlu diambil ulang. ${quality.reasons.join(' ')}',
      };

  Future<void> _showQualityWarning(PhotoQualityAssessment quality) {
    final needsRetake = quality.needsRetake;
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(needsRetake ? 'Foto perlu diulang' : 'Periksa kualitas foto'),
        content: Text(
          quality.reasons.isEmpty
              ? 'Kualitas foto dapat diterima.'
              : '${quality.reasons.join('\n')}\n\nFoto asli tetap disimpan sebagai raw data.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Lanjutkan'),
          ),
          if (needsRetake)
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                _takePhoto();
              },
              child: const Text('Ambil Ulang'),
            ),
        ],
      ),
    );
  }

  Future<void> _saveInspection() async {
    setState(() => _saving = true);
    try {
      final notes = _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim();
      final database = ref.read(databaseProvider);
      if (_draft == null) {
        await database.createObservation(
          treeId: widget.treeId,
          inspectionMode: _mode.databaseValue,
          notes: notes,
        );
      } else {
        await database.completeInspection(draft: _draft!, notes: notes);
      }
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Pemeriksaan tersimpan.')));
      Navigator.of(context).pop();
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Data belum dapat disimpan. Tidak ada data yang hilang. Silakan coba kembali.',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
