import 'package:dio/dio.dart';
import '../model/user_model.dart';
import '../helpers/api_client.dart';
import '../helpers/user.info.dart';

class LoginController {
  final ApiClient _apiClient = ApiClient();

  // Fungsi untuk memvalidasi kredensial login dengan API
  Future<bool> login(UserModel user) async {
    try {
      final response = await _apiClient.post('/login', user.toJson());

      if (response.statusCode == 200) {
        // Memeriksa apakah login berhasil berdasarkan respons API
        final jsonData = response.data;
        final token = jsonData['access_token'];
        final email = jsonData['user']['email'];

        // Menyimpan token dan email menggunakan SharedPreferences
        await UserInfo().setToken(token);
        await UserInfo().setEmail(email);

        return true;
      } else {
        // Menangani respons login yang tidak valid
        return false;
      }
    } catch (e) {
      // Menangani kesalahan (misalnya, masalah jaringan)
      print('Login error: $e');
      return false;
    }
  }
}
