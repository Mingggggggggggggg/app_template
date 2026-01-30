// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }

  @override
  String get loginName => 'Benutzername / Emailadresse ';

  @override
  String get password => 'Passwort';

  @override
  String get login => 'Anmelden';

  @override
  String get register => 'Registrieren';

  @override
  String get invalidCredentials => 'Ungültigeg Zugangsdaten';

  @override
  String get appearance => 'Design';

  @override
  String get amoled => 'AMOLED';

  @override
  String get lightmode => 'Hellmodus';

  @override
  String get darkmode => 'Dunkelmodus';

  @override
  String get colorpicker => 'Farbrad';

  @override
  String get contents => 'Inhalte';

  @override
  String get privacyAndSecurity => 'Privatssphäre & Sicherheit';

  @override
  String get storage => 'Speicher';

  @override
  String get miscellaneous => 'Verschiedenes';

  @override
  String get language => 'Sprache';

  @override
  String get about => 'Über die App';

  @override
  String get logout => 'Abmelden';

  @override
  String get cardSize => 'Kartengröße';

  @override
  String get osLicense => 'Open Source Lizenzen';

  @override
  String get selectColor => 'Wähle eine Farbe aus!';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get reset => 'Reset';

  @override
  String get save => 'Speichern';

  @override
  String get contact => 'Kontakt';

  @override
  String get bugreport => 'Bugreport';

  @override
  String get imprint => 'Imprint';

  @override
  String get appversion => 'Appversion';

  @override
  String get placeholder => 'Platzhalter';
}
