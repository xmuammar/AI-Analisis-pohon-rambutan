import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/tree.dart';
import 'schema.dart';

final databaseProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError('Database belum diinisialisasi.'),
);

class AppDatabase {
  AppDatabase._(this._executor);

  final QueryExecutor _executor;

  factory AppDatabase.open() {
    return AppDatabase._(
      LazyDatabase(() async {
        final directory = await getApplicationDocumentsDirectory();
        final databaseFile = File(
          path.join(directory.path, 'ai_analis_rambutan.sqlite'),
        );
        return NativeDatabase.createInBackground(databaseFile);
      }),
    );
  }

  factory AppDatabase.inMemory() => AppDatabase._(NativeDatabase.memory());

  Future<void> initialize() async {
    await _executor.ensureOpen(DatabaseMigrator());
  }

  Future<List<TreeSummary>> listTrees() async {
    final rows = await _executor.runSelect(
      'SELECT tree_id, tree_code, variety, status, active '
      'FROM trees WHERE deleted_at IS NULL ORDER BY tree_code',
      const [],
    );
    return rows.map(TreeSummary.fromRow).toList(growable: false);
  }

  Future<TreeSummary?> findTree(int id) async {
    final rows = await _executor.runSelect(
      'SELECT tree_id, tree_code, variety, status, active FROM trees '
      'WHERE tree_id = ? AND deleted_at IS NULL',
      [id],
    );
    return rows.isEmpty ? null : TreeSummary.fromRow(rows.single);
  }

  Future<int> createObservation({
    required int treeId,
    required String inspectionMode,
    String? notes,
  }) {
    return _executor.runInsert(
      'INSERT INTO observation_sessions '
      '(tree_id, observation_datetime, inspection_mode, notes, created_at, updated_at) '
      'VALUES (?, ?, ?, ?, ?, ?)',
      [treeId, _now(), inspectionMode, notes, _now(), _now()],
    );
  }

  Future<InspectionDraft> startInspectionDraft({
    required int treeId,
    required String inspectionMode,
    String? notes,
  }) async {
    final observationId = await createObservation(
      treeId: treeId,
      inspectionMode: inspectionMode,
      notes: notes,
    );
    final captureSessionId = await _executor.runInsert(
      'INSERT INTO image_capture_sessions '
      '(observation_id, started_at, capture_mode, status) VALUES (?, ?, ?, ?)',
      [observationId, _now(), inspectionMode, 'IN_PROGRESS'],
    );
    return InspectionDraft(
      observationId: observationId,
      captureSessionId: captureSessionId,
    );
  }

  Future<int> recordPhoto({
    required int captureSessionId,
    required String captureType,
    required String filePath,
    required String checksum,
    String? qualityStatus,
    String? qualityReasons,
    int? widthPx,
    int? heightPx,
  }) {
    return _executor.runInsert(
      'INSERT INTO photos (image_capture_session_id, capture_type, file_path, '
      'captured_at, quality_status, quality_reasons, storage_policy, checksum, '
      'width_px, height_px) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        captureSessionId,
        captureType,
        filePath,
        _now(),
        qualityStatus,
        qualityReasons,
        'APP_PRIVATE',
        checksum,
        widthPx,
        heightPx,
      ],
    );
  }

  Future<void> completeInspection({
    required InspectionDraft draft,
    String? notes,
  }) async {
    final now = _now();
    await _executor.runUpdate(
      'UPDATE observation_sessions SET notes = ?, updated_at = ? '
      'WHERE observation_id = ?',
      [notes, now, draft.observationId],
    );
    await _executor.runUpdate(
      'UPDATE image_capture_sessions SET completed_at = ?, status = ? '
      'WHERE image_capture_session_id = ?',
      [now, 'COMPLETED', draft.captureSessionId],
    );
  }

  Future<int> photoCountForCaptureSession(int captureSessionId) async {
    final rows = await _executor.runSelect(
      'SELECT COUNT(*) AS total FROM photos WHERE image_capture_session_id = ?',
      [captureSessionId],
    );
    return rows.single['total']! as int;
  }

  Future<String?> latestPhotoQualityStatus(int captureSessionId) async {
    final rows = await _executor.runSelect(
      'SELECT quality_status FROM photos '
      'WHERE image_capture_session_id = ? '
      'ORDER BY photo_id DESC LIMIT 1',
      [captureSessionId],
    );
    return rows.isEmpty ? null : rows.single['quality_status'] as String?;
  }

  Future<void> close() => _executor.close();

  String _now() => DateTime.now().toUtc().toIso8601String();
}

class InspectionDraft {
  const InspectionDraft({
    required this.observationId,
    required this.captureSessionId,
  });

  final int observationId;
  final int captureSessionId;
}
