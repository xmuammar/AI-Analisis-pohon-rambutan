abstract class VisionProvider {
  bool get isInstalled;
}

class UnavailableVisionProvider implements VisionProvider {
  const UnavailableVisionProvider();

  @override
  bool get isInstalled => false;
}

class FakeVisionProvider implements VisionProvider {
  const FakeVisionProvider({this.installed = false});

  final bool installed;

  @override
  bool get isInstalled => installed;
}
