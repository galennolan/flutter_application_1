import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token";
const String USERNAME = "username";

class UserInfo {
  Future<void> setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(TOKEN, value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(TOKEN);
  }

  Future<void> setUsername(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(USERNAME, value);
  }

  Future<String?> getUsername() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(USERNAME);
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
