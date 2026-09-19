import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/tree_repository.dart';
import '../../domain/entities/tree.dart';

final treeDetailProvider = FutureProvider.family<TreeSummary?, int>((ref, id) {
  return TreeRepository(ref.watch(databaseProvider)).findById(id);
});

class TreeDetailPage extends ConsumerWidget {
  const TreeDetailPage({required this.treeId, super.key});

  final int treeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(treeDetailProvider(treeId));
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pohon')),
      body: tree.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) =>
            const Center(child: Text('Data pohon belum dapat dimuat.')),
        data: (data) {
          if (data == null) {
            return const Center(child: Text('Pohon tidak ditemukan.'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                data.code,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(data.variety),
              const SizedBox(height: 20),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status: data awal'),
                      SizedBox(height: 8),
                      Text(
                        'Belum ada observasi. Mulai pemeriksaan untuk membangun baseline pribadi pohon ini.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => context.go('/trees/$treeId/inspection'),
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Mulai Pemeriksaan'),
              ),
            ],
          );
        },
      ),
    );
  }
}
