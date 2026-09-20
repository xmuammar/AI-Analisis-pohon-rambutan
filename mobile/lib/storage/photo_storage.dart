import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class StoredPhoto {
  const StoredPhoto({required this.path, required this.checksum});

  final String path;
  final String checksum;
}

/// Menyimpan foto asli di penyimpanan privat aplikasi; SQLite hanya menyimpan
/// metadata dan path, bukan binary foto.
class PhotoStorage {
  Future<StoredPhoto> store({
    required String sourcePath,
    required int treeId,
    required String captureType,
  }) async {
    final root = await getApplicationDocumentsDirectory();
    final destinationDirectory = Directory(
      path.join(root.path, 'photos', 'tree_$treeId'),
    );
    await destinationDirectory.create(recursive: true);

    final extension = path.extension(sourcePath).isEmpty
        ? '.jpg'
        : path.extension(sourcePath).toLowerCase();
    final safeType =
        captureType.toLowerCase().replaceAll(RegExp('[^a-z0-9]+'), '_');
    final filename =
        '${DateTime.now().toUtc().microsecondsSinceEpoch}_$safeType$extension';
    final storedFile = await File(sourcePath).copy(
      path.join(destinationDirectory.path, filename),
    );
    final checksum = sha256.convert(await storedFile.readAsBytes()).toString();
    return StoredPhoto(path: storedFile.path, checksum: checksum);
  }
}
