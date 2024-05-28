import 'package:flutter/material.dart';
import '/controller/login_controller.dart';
import '/model/user_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();

  // Function to handle the login button press
  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    UserModel user = UserModel(username: username, password: password);
    bool isLoggedIn = _loginController.login(user);

    if (isLoggedIn) {
      // Navigate to a new screen or show success message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login successful!')));
    } else {
      // Show error message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login gagal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Username input field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            // Password input field
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Login button
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
