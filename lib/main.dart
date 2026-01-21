import 'package:app_template/data/constants.dart';
import 'package:app_template/data/shared_preferences/user_settings.dart';
import 'package:app_template/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Main());
}

void initThemeData() async {
  prefs = await SharedPreferences.getInstance();
  bool? themeMode = prefs.getBool(UserThemeConstants.userThemeKey);
  bool? amoledMode = prefs.getBool(UserThemeConstants.userAmoledKey);
  //! Color musst Int sein!!!
  int? colorSeed = prefs.getInt(UserThemeConstants.userColorSeed);
  darkmodeNotifier.value = themeMode ?? false;
  amoledmodeNotifier.value = amoledMode ?? false;
  seedColorNotifier.value = colorSeed ?? Colors.teal.toARGB32();
}

Brightness setBrightness(bool isDarkmode) {
  if (isDarkmode) {
    return Brightness.dark;
  } else {
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

ThemeData amoledTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
  );
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
      valueListenable: seedColorNotifier,
      builder: (context, userColorSeed, child) {
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
      },
    );
  }
}
