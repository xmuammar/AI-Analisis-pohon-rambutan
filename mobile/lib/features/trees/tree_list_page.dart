import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/tree_repository.dart';
import '../../domain/entities/tree.dart';

final treesProvider = FutureProvider<List<TreeSummary>>((ref) {
  return TreeRepository(ref.watch(databaseProvider)).listActiveTrees();
});

class TreeListPage extends ConsumerWidget {
  const TreeListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: const Text('Pohon Saya')),
        body: ref.watch(treesProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: Text('Daftar pohon belum dapat dimuat.')),
              data: (trees) => ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: trees.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final tree = trees[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.park)),
                      title: Text(tree.code),
                      subtitle: Text('${tree.variety} · ${tree.status}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/trees/${tree.id}'),
                    ),
                  );
                },
              ),
            ),
      );
}
