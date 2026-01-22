import 'package:app_template/data/classes/theme_manager.dart';
import 'package:app_template/l10n/app_localizations.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';

final themeManager = ThemeManager();

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeManager,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,

            theme: themeManager.getThemeData(isDark: false),
            darkTheme: themeManager.getThemeData(isDark: true),
            themeMode: themeManager.themeMode,
            home: WidgetTree(),
          ),
        );
      },
    );
  }
}
