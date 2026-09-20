import 'dart:typed_data';

import 'package:ai_analis_rambutan/ai/vision/image_quality_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const engine = ImageQualityEngine();

  Uint8List rgba(int width, int height, int Function(int x, int y) luminance) {
    final pixels = Uint8List(width * height * 4);
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        final offset = (y * width + x) * 4;
        final value = luminance(x, y);
        pixels[offset] = value;
        pixels[offset + 1] = value;
        pixels[offset + 2] = value;
        pixels[offset + 3] = 255;
      }
    }
    return pixels;
  }

  test('foto yang sangat gelap diberi peringatan retake', () {
    final result = engine.assessPixels(
      rgba(800, 600, (_, __) => 5),
      widthPx: 800,
      heightPx: 600,
    );

    expect(result.status, PhotoQualityStatus.retakeRequired);
    expect(result.reasons, contains('Foto terlalu gelap.'));
  });

  test('foto dengan detail dan pencahayaan seimbang dinilai baik', () {
    final result = engine.assessPixels(
      rgba(800, 600, (x, y) => (x + y).isEven ? 90 : 180),
      widthPx: 800,
      heightPx: 600,
    );

    expect(result.status, PhotoQualityStatus.good);
    expect(result.reasons, isEmpty);
  });
}
