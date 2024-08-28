import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  late SharedPreferences _prefs;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  Future<void> setUserToken(String token) async {
    await _prefs.setString('user_token', token);
  }

  String? getUserToken() {
    return _prefs.getString('user_token');
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
