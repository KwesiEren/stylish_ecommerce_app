import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String _authTokenKey = "auth_token";
  static const String _userEmailKey = "user_email";
  static const String _userNameKey = "user_name";

  // 🔹 Save auth token
  static Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
  }

  // 🔹 Get auth token
  static Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  // 🔹 Remove auth token
  static Future<void> removeAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
  }

  // 🔹 Save user info
  static Future<void> saveUserInfo(String email, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userNameKey, name);
  }

  // 🔹 Get user info
  static Future<Map<String, String?>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "email": prefs.getString(_userEmailKey),
      "name": prefs.getString(_userNameKey),
    };
  }

  // 🔹 Clear all session data
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userNameKey);
  }
}
