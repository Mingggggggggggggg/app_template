import 'package:app_template/data/constants.dart';
import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:app_template/pages/home_page.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Main());
}

void initThemeData() async {
  prefs = await SharedPreferences.getInstance();
  int? themeMode = prefs.getInt(UserThemeConstants.userThemeKey);
  //! Color musst Int sein!!!
  int? colorSeed = prefs.getInt(UserThemeConstants.userColorSeed);
  darkmodeNotifier.value = themeMode ?? 0;
  seedColorNotifier.value = colorSeed ?? Colors.teal.toARGB32();
}

Brightness setBrightness(int darkmodeNotifier) {
  switch (darkmodeNotifier) {
    case 0:
      return Brightness.light;
    case 1:
      return Brightness.dark;
    case 2:
      return Brightness.dark;
    default:
      print("ThemeMode fehlerhaft");
      return Brightness.light;
  }
}

int setColorTheme(int? colorSeed) {
  if (colorSeed == null) {
    return Colors.teal.toARGB32();
  } else {
    return colorSeed;
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    initThemeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkmodeNotifier,
      builder: (context, thememode, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.teal,
                brightness: setBrightness(thememode),
              ),
            ),
            home: WidgetTree(),
          ),
        );
      },
    );
  }
}
