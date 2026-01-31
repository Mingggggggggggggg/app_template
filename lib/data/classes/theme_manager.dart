import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends ChangeNotifier {
  // Standard
  ThemeMode _themeMode = ThemeMode.system;
  bool _isAmoled = false;
  Color _seedColor = Colors.teal;

  // Getter
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isAmoled => _isAmoled;
  Color get seedColor => _seedColor;
  Color get pickedColor => _seedColor;

  ThemeManager() {
    _loadUserPreferences();
  }

  ThemeData getThemeData({required bool isDark}) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final bool useAmoled = isDark && _isAmoled;

    var theme = ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: brightness,
      ),
    );

    if (useAmoled) {
      theme = theme.copyWith(
        // Colors.black, um transparenzprobleme zu vermeiden
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.transparent,
        ),
        tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        colorScheme: theme.colorScheme.copyWith(surface: Colors.black),
      );
    }
    return theme;
  }

  void setTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveUserPreferences();
    notifyListeners();
  }

  void setAmoled(bool useAmoled) {
    _isAmoled = useAmoled;
    _saveUserPreferences();
    notifyListeners();
  }

  void setColorSeed(Color color) {
    _seedColor = color;
    _saveUserPreferences();
    notifyListeners();
  }

  Future<void> _saveUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("userThemeKey", _themeMode == ThemeMode.dark);
    prefs.setBool("userAmoledKey", isAmoled);
    prefs.setInt("userColorSeed", _seedColor.toARGB32());
  }

  // Lade ThemeSettings
  Future<void> _loadUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool("userThemeKey") ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _isAmoled = prefs.getBool("userAmoledKey") ?? false;
    _seedColor = Color(prefs.getInt("userColorSeed") ?? Colors.teal.toARGB32());

    notifyListeners();
  }
}
