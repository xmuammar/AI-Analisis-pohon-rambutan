import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class AiAnalisRambutanApp extends StatelessWidget {
  const AiAnalisRambutanApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'AiAnalisRambutan',
        theme: buildAppTheme(Brightness.light),
        darkTheme: buildAppTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        routerConfig: buildRouter(),
      );
}
