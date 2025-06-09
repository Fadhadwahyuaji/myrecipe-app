import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isLoggedIn => _prefs.getBool('isLoggedIn') ?? false;
  static Future<void> setLoginStatus(bool status) async =>
      _prefs.setBool('isLoggedIn', status);
  static Future<void> clear() async => _prefs.clear();
}
