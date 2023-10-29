import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String userIdKey = 'user_id_key';
  static const String loginTokenKey = 'login_token';
  static const String resetPasswordTokenKey = 'reset_password_token';

  static Future<void> saveLoginToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loginTokenKey, token);
  }

  static Future<String?> getLoginToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(loginTokenKey);
  }

  static Future<void> saveResetPasswordToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(resetPasswordTokenKey, token);
  }

  static Future<String?> getResetPasswordToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(resetPasswordTokenKey);
  }

  static Future<void> deleteLoginToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(loginTokenKey);
  }

  static Future<void> deleteResetPasswordToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(resetPasswordTokenKey);
  }
  static Future<void> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userIdKey, userId);
  }

  static Future<String?> getUSerId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

}