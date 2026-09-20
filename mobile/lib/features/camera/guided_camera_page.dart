import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GuidedCameraPage extends StatefulWidget {
  const GuidedCameraPage({
    required this.title,
    required this.guidance,
    super.key,
  });

  final String title;
  final String guidance;

  @override
  State<GuidedCameraPage> createState() => _GuidedCameraPageState();
}

class _GuidedCameraPageState extends State<GuidedCameraPage> {
  CameraController? _controller;
  String? _error;
  bool _takingPhoto = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw StateError('Kamera tidak tersedia pada perangkat ini.');
      }
      final backCamera = cameras.where(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );
      final selectedCamera =
          backCamera.isEmpty ? cameras.first : backCamera.first;
      final controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() => _controller = controller);
    } on CameraException catch (error) {
      if (mounted) {
        setState(() => _error = _cameraErrorMessage(error));
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error =
            'Kamera belum dapat dibuka. Periksa izin kamera lalu coba lagi.');
      }
    }
  }

  String _cameraErrorMessage(CameraException error) => switch (error.code) {
        'CameraAccessDenied' =>
          'Izin kamera ditolak. Izinkan kamera di pengaturan aplikasi.',
        'CameraAccessDeniedWithoutPrompt' =>
          'Izin kamera perlu diaktifkan melalui pengaturan perangkat.',
        _ => 'Kamera belum dapat dibuka. Periksa izin kamera lalu coba lagi.',
      };

  Future<void> _capture() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || _takingPhoto) {
      return;
    }
    setState(() => _takingPhoto = true);
    try {
      final photo = await controller.takePicture();
      if (mounted) {
        Navigator.of(context).pop(photo.path);
      }
    } on CameraException {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Foto belum dapat diambil. Silakan coba lagi.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _takingPhoto = false);
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: _error != null
          ? _CameraError(message: _error!, retry: _initializeCamera)
          : controller == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(child: CameraPreview(controller)),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SafeArea(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(12),
                          color: Colors.black54,
                          child: Text(widget.guidance,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: IconButton.filled(
                            onPressed: _takingPhoto ? null : _capture,
                            iconSize: 36,
                            icon: _takingPhoto
                                ? const SizedBox.square(
                                    dimension: 24,
                                    child: CircularProgressIndicator())
                                : const Icon(Icons.camera_alt),
                            tooltip: 'Ambil foto',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}

class _CameraError extends StatelessWidget {
  const _CameraError({required this.message, required this.retry});

  final String message;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.no_photography_outlined,
                  color: Colors.white, size: 48),
              const SizedBox(height: 16),
              Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 16),
              OutlinedButton(onPressed: retry, child: const Text('Coba lagi')),
            ],
          ),
        ),
      );
}
