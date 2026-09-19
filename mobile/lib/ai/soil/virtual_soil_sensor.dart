enum RootZoneMoisture {
  veryDry,
  dry,
  slightlyDry,
  moist,
  veryMoist,
  saturated,
  possibleWaterlogging,
}

class SoilEvidence {
  const SoilEvidence({
    this.surfaceDark = false,
    this.standingWater = false,
    this.leafWilt = false,
    this.daysSinceWatering,
  });

  final bool surfaceDark;
  final bool standingWater;
  final bool leafWilt;
  final int? daysSinceWatering;
}

class SoilInference {
  const SoilInference({
    required this.moisture,
    required this.confidence,
    required this.explanations,
  });

  final RootZoneMoisture moisture;
  final double confidence;
  final List<String> explanations;
}

class VirtualSoilSensor {
  SoilInference infer(SoilEvidence evidence) {
    final explanations = <String>[];
    if (evidence.standingWater) {
      explanations.add('Genangan terlihat pada observasi tanah.');
      return SoilInference(
        moisture: RootZoneMoisture.possibleWaterlogging,
        confidence: 0.7,
        explanations: explanations,
      );
    }
    if (evidence.surfaceDark) {
      explanations.add('Permukaan tanah terlihat gelap.');
    }
    if (evidence.leafWilt) {
      explanations.add('Daun dicatat layu pada pemeriksaan ini.');
    }
    if (evidence.daysSinceWatering != null) {
      explanations.add(
        'Riwayat penyiraman tersedia dari ${evidence.daysSinceWatering} hari lalu.',
      );
    }
    if (evidence.surfaceDark && !evidence.leafWilt) {
      return SoilInference(
        moisture: RootZoneMoisture.moist,
        confidence: 0.55,
        explanations: explanations,
      );
    }
    return SoilInference(
      moisture: RootZoneMoisture.slightlyDry,
      confidence: 0.35,
      explanations: explanations.isEmpty
          ? ['Bukti belum cukup untuk memperkirakan kondisi zona akar.']
          : explanations,
    );
  }
}
