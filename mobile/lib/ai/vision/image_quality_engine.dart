import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

enum PhotoQualityStatus { good, acceptable, poor, retakeRequired }

extension PhotoQualityStatusDatabaseValue on PhotoQualityStatus {
  String get databaseValue => switch (this) {
        PhotoQualityStatus.good => 'GOOD',
        PhotoQualityStatus.acceptable => 'ACCEPTABLE',
        PhotoQualityStatus.poor => 'POOR',
        PhotoQualityStatus.retakeRequired => 'RETAKE_REQUIRED',
      };
}

class ImageQualityMetrics {
  const ImageQualityMetrics({
    required this.widthPx,
    required this.heightPx,
    required this.meanBrightness,
    required this.darkPixelRatio,
    required this.brightPixelRatio,
    required this.contrast,
    required this.detailScore,
  });

  final int widthPx;
  final int heightPx;
  final double meanBrightness;
  final double darkPixelRatio;
  final double brightPixelRatio;
  final double contrast;
  final double detailScore;
}

class PhotoQualityAssessment {
  const PhotoQualityAssessment({
    required this.status,
    required this.reasons,
    required this.metrics,
  });

  final PhotoQualityStatus status;
  final List<String> reasons;
  final ImageQualityMetrics metrics;

  bool get needsRetake => status == PhotoQualityStatus.retakeRequired;

  String get databaseReasons => reasons.join(' | ');
}

/// Pemeriksaan kualitas lokal yang bersifat heuristik, bukan model vision dan
/// bukan diagnosis tanaman. Nilainya dipakai untuk memberi peringatan sebelum
/// foto dikirim ke pipeline analisis saat model tersedia.
class ImageQualityEngine {
  const ImageQualityEngine();

  Future<PhotoQualityAssessment> assessFile(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    try {
      final frame = await codec.getNextFrame();
      final image = frame.image;
      try {
        final pixels =
            await image.toByteData(format: ui.ImageByteFormat.rawRgba);
        if (pixels == null) {
          throw StateError('Pixel foto tidak dapat dibaca.');
        }
        return assessPixels(
          pixels.buffer.asUint8List(
            pixels.offsetInBytes,
            pixels.lengthInBytes,
          ),
          widthPx: image.width,
          heightPx: image.height,
        );
      } finally {
        image.dispose();
      }
    } finally {
      codec.dispose();
    }
  }

  PhotoQualityAssessment assessPixels(
    Uint8List pixels, {
    required int widthPx,
    required int heightPx,
  }) {
    if (widthPx <= 0 ||
        heightPx <= 0 ||
        pixels.length < widthPx * heightPx * 4) {
      throw ArgumentError('Data pixel RGBA tidak valid.');
    }

    const maxSamplesPerAxis = 160;
    final stepX = math.max(1, widthPx ~/ maxSamplesPerAxis);
    final stepY = math.max(1, heightPx ~/ maxSamplesPerAxis);
    final luminance = <double>[];
    var dark = 0;
    var bright = 0;
    var detailTotal = 0.0;
    var detailCount = 0;

    double lumaAt(int x, int y) {
      final offset = (y * widthPx + x) * 4;
      return (0.2126 * pixels[offset] +
              0.7152 * pixels[offset + 1] +
              0.0722 * pixels[offset + 2]) /
          255;
    }

    for (var y = 0; y < heightPx; y += stepY) {
      for (var x = 0; x < widthPx; x += stepX) {
        final value = lumaAt(x, y);
        luminance.add(value);
        if (value < 0.12) dark++;
        if (value > 0.92) bright++;
        if (x + stepX < widthPx && y + stepY < heightPx) {
          final horizontal = (value - lumaAt(x + stepX, y)).abs();
          final vertical = (value - lumaAt(x, y + stepY)).abs();
          detailTotal += (horizontal + vertical) / 2;
          detailCount++;
        }
      }
    }

    final mean = luminance.reduce((a, b) => a + b) / luminance.length;
    final variance = luminance
            .map((value) => math.pow(value - mean, 2))
            .reduce((a, b) => a + b) /
        luminance.length;
    final metrics = ImageQualityMetrics(
      widthPx: widthPx,
      heightPx: heightPx,
      meanBrightness: mean,
      darkPixelRatio: dark / luminance.length,
      brightPixelRatio: bright / luminance.length,
      contrast: math.sqrt(variance),
      detailScore: detailCount == 0 ? 0 : detailTotal / detailCount,
    );
    return _classify(metrics);
  }

  PhotoQualityAssessment _classify(ImageQualityMetrics metrics) {
    final reasons = <String>[];
    if (metrics.widthPx < 640 || metrics.heightPx < 480) {
      reasons.add('Resolusi foto terlalu rendah.');
    }
    if (metrics.meanBrightness < 0.16 || metrics.darkPixelRatio > 0.72) {
      reasons.add('Foto terlalu gelap.');
    } else if (metrics.meanBrightness < 0.27 || metrics.darkPixelRatio > 0.48) {
      reasons.add('Pencahayaan foto cenderung gelap.');
    }
    if (metrics.meanBrightness > 0.88 || metrics.brightPixelRatio > 0.72) {
      reasons.add('Foto terlalu terang atau overexposed.');
    } else if (metrics.meanBrightness > 0.76 ||
        metrics.brightPixelRatio > 0.48) {
      reasons.add('Area terang pada foto cukup dominan.');
    }
    if (metrics.detailScore < 0.012 || metrics.contrast < 0.055) {
      reasons.add('Detail foto rendah; fokus atau framing perlu diperiksa.');
    } else if (metrics.detailScore < 0.02 || metrics.contrast < 0.075) {
      reasons.add('Detail foto terbatas; pastikan objek terlihat jelas.');
    }

    final critical = reasons
        .where(
          (reason) =>
              reason == 'Resolusi foto terlalu rendah.' ||
              reason == 'Foto terlalu gelap.' ||
              reason == 'Foto terlalu terang atau overexposed.' ||
              reason ==
                  'Detail foto rendah; fokus atau framing perlu diperiksa.',
        )
        .length;
    final status = critical >= 2
        ? PhotoQualityStatus.retakeRequired
        : critical == 1
            ? PhotoQualityStatus.poor
            : reasons.isNotEmpty
                ? PhotoQualityStatus.acceptable
                : PhotoQualityStatus.good;
    return PhotoQualityAssessment(
      status: status,
      reasons: reasons,
      metrics: metrics,
    );
  }
}
