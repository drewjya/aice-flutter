import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();
  static const _sessionKey = 'SUnaasugBASGy';
  static Future setSession(String session) async {
    await _instance.setString(_sessionKey, session);
  }

  static String? getSession() => _instance.getString(_sessionKey);

  static Future removeSession() async {
    await _instance.remove(_sessionKey);
  }
}
