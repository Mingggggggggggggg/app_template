import 'package:app_template/data/services/log_auth.dart';
import 'package:flutter/material.dart';

class LoginStatusManager extends ChangeNotifier {
  final LogAuth _logAuth = LogAuth();

  bool _isLoading = false;
  String? _errorMessage;

  // Getter
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String userName, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _logAuth.login(userName, password);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString().replaceAll("Exception: ", "");
      notifyListeners();

      Future.delayed(const Duration(seconds: 3), () {
        _errorMessage = null;
        notifyListeners();
      });

      return false;
    }
  }
}
