import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Developer Center')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            _Section(
              title: 'System Overview',
              detail: 'Build, runtime environment, perangkat, dan penyimpanan.',
            ),
            _Section(
              title: 'Database Manager',
              detail:
                  'Schema v1, migrasi berversi, integritas, statistik, dan browser tabel.',
            ),
            _Section(
              title: 'Model Manager',
              detail:
                  'Model pack belum terpasang. Registry dan metadata telah disiapkan.',
            ),
            _Section(
              title: 'Vision & XAI',
              detail:
                  'Tidak ada inference tanpa model. Prediksi kelak dapat ditelusuri melalui provenance.',
            ),
            _Section(
              title: 'Virtual Soil Sensor',
              detail:
                  'Baseline aturan tersedia; setiap inferensi menyimpan bukti yang digunakan.',
            ),
            _Section(
              title: 'Backup & Diagnostics',
              detail:
                  'Envelope JSON dengan checksum tersedia sebagai fondasi export dan restore aman.',
            ),
          ],
        ),
      );
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(detail),
          trailing: const Icon(Icons.chevron_right),
        ),
      );
}
