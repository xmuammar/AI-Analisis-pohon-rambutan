enum ConfidenceLevel { low, medium, high }

class ConfidenceEngine {
  const ConfidenceEngine();

  ConfidenceLevel classify(double confidence) {
    if (confidence >= 0.75) return ConfidenceLevel.high;
    if (confidence >= 0.45) return ConfidenceLevel.medium;
    return ConfidenceLevel.low;
  }
}
