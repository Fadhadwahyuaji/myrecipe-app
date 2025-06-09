import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // simulate login
    if (email == "user@demo.com" && password == "password") {
      await SharedPrefs.setLoginStatus(true);
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await SharedPrefs.clear();
    notifyListeners();
  }
}
