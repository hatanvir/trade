import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static var TOKEN = 'token';
  static var ID = 'id';



  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setString(key, str) async {
    await _sharedPreferences!.setString(key, str);
  }

  static Future<String?> getString(key) async {
    return _sharedPreferences!.getString(key);
  }

  static Future<void> setBool(key, str) async {
    await _sharedPreferences!.setBool(key, str);
  }

  static Future<bool?> getBool(key) async {
    return _sharedPreferences!.getBool(key);
  }

  static clear() async {
    await _sharedPreferences!.clear();
  }
}
