import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();
  static const _sessionKey = 'SUnaasugBASGy';
  static const _isFirstTime = 'Fd;}{sdirsdsdstTfi32m2e21';
  static Future setSession(String session) async {
    await _instance.setString(_sessionKey, session);
  }

  static Future setIsFirstTime() async {
    await _instance.setBool(_isFirstTime, true);
  }

  static String? getSession() => _instance.getString(_sessionKey);
  static bool getIsFirstTime() => _instance.getBool(_isFirstTime) ?? false;

  static Future removeSession() async {
    await _instance.remove(_sessionKey);
  }
}
