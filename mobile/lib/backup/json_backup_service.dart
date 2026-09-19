import 'dart:convert';

import 'package:crypto/crypto.dart';

class JsonBackupService {
  const JsonBackupService();

  Map<String, Object?> createEnvelope({
    required int schemaVersion,
    required Map<String, Object?> data,
  }) {
    final encodedData = jsonEncode(data);
    return <String, Object?>{
      'backup_format': 'AiAnalisRambutan.JSON.v1',
      'schema_version': schemaVersion,
      'created_at': DateTime.now().toUtc().toIso8601String(),
      'data': data,
      'checksum_sha256': sha256.convert(utf8.encode(encodedData)).toString(),
    };
  }

  bool hasValidChecksum(Map<String, Object?> backup) {
    final data = backup['data'];
    final checksum = backup['checksum_sha256'];
    if (data is! Map || checksum is! String) return false;
    return sha256.convert(utf8.encode(jsonEncode(data))).toString() == checksum;
  }
}
