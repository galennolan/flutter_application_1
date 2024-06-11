import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = "token"; // Konstanta untuk kunci token
const String EMAIL = "email"; // Konstanta untuk kunci email pengguna

class UserInfo {
  // Metode untuk menyimpan token ke shared preferences
  Future<void> setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences
        .getInstance(); // Mendapatkan instance shared preferences
    await pref.setString(TOKEN, value); // Menyimpan token sebagai string
  }

  // Metode untuk mengambil token dari shared preferences
  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences
        .getInstance(); // Mendapatkan instance shared preferences
    return pref.getString(TOKEN); // Mengambil token yang disimpan
  }

  // Metode untuk menyimpan email pengguna ke shared preferences
  Future<void> setEmail(String value) async {
    final SharedPreferences pref = await SharedPreferences
        .getInstance(); // Mendapatkan instance shared preferences
    await pref.setString(EMAIL, value); // Menyimpan email sebagai string
  }

  // Metode untuk mengambil email pengguna dari shared preferences
  Future<String?> getEmail() async {
    final SharedPreferences pref = await SharedPreferences
        .getInstance(); // Mendapatkan instance shared preferences
    return pref.getString(EMAIL); // Mengambil email yang disimpan
  }

  // Metode untuk menghapus semua data dari shared preferences (logout)
  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences
        .getInstance(); // Mendapatkan instance shared preferences
    await pref.clear(); // Menghapus semua data yang disimpan
  }
}
