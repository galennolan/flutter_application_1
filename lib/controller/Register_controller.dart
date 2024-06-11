import '../helpers/api_client.dart';

class RegisterController {
  final ApiClient _apiClient = ApiClient();

  Future<bool> register(String name, String email, String password) async {
    try {
      final response = await _apiClient.post('register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }
}
