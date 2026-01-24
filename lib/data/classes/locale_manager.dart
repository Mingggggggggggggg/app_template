import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager extends ChangeNotifier {
  // Standard
  Locale _locale = const Locale("en", "UK");

  // Getter
  Locale get locale => _locale;

  LocaleManager() {
    _loadUserPreferences();
  }

  void changeLocale(String localeCode) {
    _locale = Locale(localeCode);
    _saveUserPreference();
    notifyListeners();
  }

  Future<void> _saveUserPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userLocaleSetting", _locale.languageCode);

    notifyListeners();
  }

  Future<void> _loadUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString("userLocaleSetting");

    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }
}
