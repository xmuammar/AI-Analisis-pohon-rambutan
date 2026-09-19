import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';

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
                    const Icon(Icons.model_training_outlined, size: 36),
                    const SizedBox(height: 12),
                    Text(
                      'Model analisis visual belum terpasang.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Foto dapat dicatat setelah modul kamera dan model pack tersedia. Tidak ada hasil AI yang dibuat tanpa model.',
                    ),
                    const SizedBox(height: 12),
                    const OutlinedButton(
                      onPressed: null,
                      child: Text('Download Model'),
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
            onPressed: _saving ? null : _saveManualFallback,
            child: Text(_saving ? 'Menyimpan...' : 'Simpan Pemeriksaan Manual'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveManualFallback() async {
    setState(() => _saving = true);
    try {
      await ref.read(databaseProvider).createObservation(
            treeId: widget.treeId,
            inspectionMode: _mode.databaseValue,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );
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
