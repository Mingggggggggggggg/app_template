// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get loginName => 'Username / Email address ';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get appearance => 'Appearance';

  @override
  String get amoled => 'AMOLED';

  @override
  String get lightmode => 'Lightmode';

  @override
  String get darkmode => 'Darkmode';

  @override
  String get colorpicker => 'Colorpicker';

  @override
  String get contents => 'Contents';

  @override
  String get privacyAndSecurity => 'Privacy & Security';

  @override
  String get storage => 'Storage';

  @override
  String get miscellaneous => 'Miscellaneous';

  @override
  String get language => 'Language';

  @override
  String get about => 'About';

  @override
  String get logout => 'Logout';

  @override
  String get cardSize => 'Card Size';

  @override
  String get osLicense => 'Open Source Licenses';

  @override
  String get selectColor => 'Select a Color!';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Save';

  @override
  String get contact => 'Contact';

  @override
  String get bugreport => 'Fehler melden';

  @override
  String get imprint => 'Impressum';

  @override
  String get appversion => 'Appversion';

  @override
  String get placeholder => 'Placeholder';
}
