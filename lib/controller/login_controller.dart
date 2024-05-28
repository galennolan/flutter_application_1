import '../model/user_model.dart';

class LoginController {
  // Function to validate the login credentials
  bool login(UserModel user) {
    if (user.username == 'admin' && user.password == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}
