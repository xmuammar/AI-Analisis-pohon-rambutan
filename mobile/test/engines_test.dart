import 'package:flutter_test/flutter_test.dart';

import 'package:ai_analis_rambutan/ai/confidence/confidence_engine.dart';
import 'package:ai_analis_rambutan/ai/rules/basic_rule_engine.dart';
import 'package:ai_analis_rambutan/ai/soil/virtual_soil_sensor.dart';
import 'package:ai_analis_rambutan/ai/vision/vision_provider.dart';
import 'package:ai_analis_rambutan/backup/json_backup_service.dart';

void main() {
  test('aturan menandai hama sebagai butuh perhatian', () {
    final result = BasicRuleEngine().evaluate(
      const RuleInput(pestPresent: true),
    );
    expect(result.level, AttentionLevel.urgent);
  });

  test('sensor tanah virtual menyebut genangan sebagai bukti', () {
    final result = VirtualSoilSensor().infer(
      const SoilEvidence(standingWater: true),
    );
    expect(result.moisture, RootZoneMoisture.possibleWaterlogging);
    expect(result.explanations, isNotEmpty);
  });

  test('confidence dan provider palsu bersifat deterministik', () {
    expect(const ConfidenceEngine().classify(0.8), ConfidenceLevel.high);
    expect(const FakeVisionProvider().isInstalled, isFalse);
  });

  test('envelope backup memverifikasi checksum data', () {
    const service = JsonBackupService();
    final backup = service.createEnvelope(
      schemaVersion: 1,
      data: {'trees': 12},
    );
    expect(service.hasValidChecksum(backup), isTrue);
  });
}
