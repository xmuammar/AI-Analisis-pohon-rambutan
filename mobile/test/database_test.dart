import 'package:flutter_test/flutter_test.dart';

import 'package:ai_analis_rambutan/data/database/app_database.dart';

void main() {
  test('migrasi v1 membuat dan mengisi 12 pohon awal', () async {
    final database = AppDatabase.inMemory();
    await database.initialize();

    final trees = await database.listTrees();

    expect(trees, hasLength(12));
    expect(trees.first.code, 'RBT-001');
    expect(trees.last.code, 'RBT-012');
    await database.close();
  });

  test('observasi manual tersimpan tanpa mengganti data pohon', () async {
    final database = AppDatabase.inMemory();
    await database.initialize();
    final tree = (await database.listTrees()).first;

    final observationId = await database.createObservation(
      treeId: tree.id,
      inspectionMode: 'MANUAL',
      notes: 'Daun terlihat hijau.',
    );

    expect(observationId, greaterThan(0));
    expect((await database.findTree(tree.id))?.code, tree.code);
    await database.close();
  });
}
