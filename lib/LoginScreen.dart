import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '/helpers/api_client.dart';
import '/helpers/user.info.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey untuk Form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input email dan password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Loading state untuk menampilkan progress indicator
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey, // Menghubungkan Form dengan GlobalKey
          child: Column(
            children: [
              // Input field untuk email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              // Input field untuk password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Menampilkan progress indicator atau tombol login
              _loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk melakukan login
  Future<void> _login() async {
    // Validasi form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true; // Menampilkan progress indicator
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      // Mengirim permintaan POST ke API untuk login
      final response = await ApiClient().post('login', {
        'email': email,
        'password': password,
      });

      setState(() {
        _loading = false; // Menyembunyikan progress indicator
      });

      if (response.statusCode == 200) {
        // Mengambil data dari respons API
        final jsonData = response.data;
        final token = jsonData['access_token'];
        final username = jsonData['user']['name'];

        // Menyimpan token dan username menggunakan SharedPreferences
        await UserInfo().setToken(token);
        await UserInfo().setUsername(username); // Jika diperlukan untuk UI

        // Menampilkan pesan sukses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful'),
            duration: Duration(seconds: 2),
          ),
        );

        // Mengarahkan pengguna ke layar menu utama
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainMenuScreen()),
        );
      } else {
        // Menampilkan pesan kesalahan jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email or password'),
          ),
        );
      }
    } catch (e) {
      print('Login error: $e'); // Menampilkan log kesalahan
      setState(() {
        _loading = false; // Menyembunyikan progress indicator
      });
      // Menampilkan pesan kesalahan jika terjadi kesalahan saat login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
    }
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Text('Welcome to the main menu!'),
      ),
    );
  }
}
