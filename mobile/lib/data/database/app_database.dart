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

  Future<void> close() => _executor.close();

  String _now() => DateTime.now().toUtc().toIso8601String();
}
