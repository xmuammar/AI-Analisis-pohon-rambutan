import '../../domain/entities/tree.dart';
import '../database/app_database.dart';

class TreeRepository {
  const TreeRepository(this._database);

  final AppDatabase _database;

  Future<List<TreeSummary>> listActiveTrees() => _database.listTrees();

  Future<TreeSummary?> findById(int id) => _database.findTree(id);
}
