import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';

// Simulierter Login und Authentifizierung
class LogAuth {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const bool simulationMode = true;

  Future<String?> login(String userName, String password) async {
    if (simulationMode) {
      return _simAuth(userName, password);
    } else {
      // eigentlich auth mit app_auth. Hier real shit implementieren
      return null;
    }
  }

  Future<String?> _simAuth(String userName, String password) async {
    // Beep boop es tut sich was getData i guess
    await Future.delayed(Duration(seconds: 2));

    if (userName != "test" && password != "test") {
      throw Exception("Benutzername oder Passwort ungültig");
    }

    const fakeToken = "xddddddd12345_AccessToken_420_69_6767676767";

    await _storage.write(key: "access_token", value: fakeToken);

    return fakeToken;
  }

  Future<String> logout() async {
    try {
      await _storage.delete(key: "access_token");
      return "Success";
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: "access_token");
    return token != null;
  }
}
