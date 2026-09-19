import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('AiAnalisRambutan')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Kondisi Kebun',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Pohon Rambutan Belereng'),
                    SizedBox(height: 12),
                    Text(
                      'Data awal siap. Lakukan pemeriksaan untuk membangun riwayat kebun.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Mulai', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            _MenuTile(
              icon: Icons.park_outlined,
              title: 'Pohon Saya',
              subtitle: 'Lihat 12 pohon dan mulai pemeriksaan.',
              onTap: () => context.go('/trees'),
            ),
            _MenuTile(
              icon: Icons.developer_mode_outlined,
              title: 'Developer Center',
              subtitle: 'Status database, model, dan diagnostik.',
              onTap: () => context.go('/developer'),
            ),
          ],
        ),
      );
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: Icon(icon, size: 30),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      );
}
