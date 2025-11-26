import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  String? get email => _email;

  // Registrar usuário
  void signUp(String email, String password) {
    _email = email;
    _password = password;
    notifyListeners();
  }

  // Login
  bool login(String email, String password) {
    if (_email == email && _password == password) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
