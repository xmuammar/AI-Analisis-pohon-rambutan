import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ai_analis_rambutan/app/app.dart';
import 'package:ai_analis_rambutan/data/database/app_database.dart';

void main() {
  testWidgets('dashboard aplikasi dapat ditampilkan',
      (WidgetTester tester) async {
    final database = AppDatabase.inMemory();
    await database.initialize();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const AiAnalisRambutanApp(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('AiAnalisRambutan'), findsOneWidget);
    expect(find.text('Pohon Saya'), findsOneWidget);
    await database.close();
  });
}
