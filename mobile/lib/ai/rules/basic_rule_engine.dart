enum AttentionLevel { normal, observe, urgent }

class RuleInput {
  const RuleInput({
    this.leafWilt = false,
    this.pestPresent = false,
    this.diseasePresent = false,
    this.waterlogging = false,
  });

  final bool leafWilt;
  final bool pestPresent;
  final bool diseasePresent;
  final bool waterlogging;
}

class RuleResult {
  const RuleResult(this.level, this.reasons);

  final AttentionLevel level;
  final List<String> reasons;
}

class BasicRuleEngine {
  RuleResult evaluate(RuleInput input) {
    final reasons = <String>[];
    if (input.pestPresent) {
      reasons.add('Tanda hama perlu diverifikasi.');
    }
    if (input.diseasePresent) {
      reasons.add('Gejala penyakit perlu diamati.');
    }
    if (input.leafWilt) {
      reasons.add('Daun tampak layu berdasarkan observasi.');
    }
    if (input.waterlogging) {
      reasons.add('Ada indikasi risiko genangan di zona akar.');
    }
    if (input.pestPresent || input.diseasePresent || input.waterlogging) {
      return RuleResult(AttentionLevel.urgent, reasons);
    }
    if (input.leafWilt) {
      return RuleResult(AttentionLevel.observe, reasons);
    }
    return const RuleResult(AttentionLevel.normal, [
      'Belum ada aturan risiko yang terpicu.',
    ]);
  }
}
