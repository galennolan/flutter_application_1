import 'package:flutter/material.dart';
import '/controller/login_controller.dart';
import '/model/user_model.dart';
import '../helpers/user.info.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();
  bool _loading = false; // Penanganan loading state

  // Fungsi untuk menangani tombol login
  Future<void> _handleLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    UserModel user = UserModel(email: email, password: password);

    setState(() {
      _loading = true; // Menampilkan loading indicator
    });

    bool isLoggedIn = await _loginController.login(user);

    setState(() {
      _loading = false; // Menyembunyikan loading indicator
    });

    if (isLoggedIn) {
      // Menampilkan pesan sukses dan navigasi ke layar utama
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login successful!')));
      // Navigasi ke layar menu utama (ganti dengan navigasi aktual Anda)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainMenuScreen()),
      );
    } else {
      // Menampilkan pesan kesalahan
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login gagal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kolom input email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Kolom input password
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            // Tombol login
            _loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _handleLogin,
                    child: Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  // Fungsi untuk menangani logout
  Future<void> _handleLogout(BuildContext context) async {
    await UserInfo().logout(); // Menghapus data pengguna dari SharedPreferences
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
      (Route<dynamic> route) => false, // Menghapus semua layar sebelumnya
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the main menu!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleLogout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
