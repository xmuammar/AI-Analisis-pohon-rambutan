class ExplanationBuilder {
  const ExplanationBuilder();

  List<String> build({
    required List<String> evidence,
    required bool hasEnoughData,
  }) {
    if (!hasEnoughData) {
      return const [
        'Data belum cukup untuk membuat penjelasan analitis yang andal.',
      ];
    }
    return evidence.isEmpty
        ? const ['Tidak ada bukti terstruktur yang tersedia untuk dijelaskan.']
        : evidence;
  }
}
