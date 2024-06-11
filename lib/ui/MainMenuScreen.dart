import 'package:flutter/material.dart';
import '../helpers/user.info.dart';
import '/ui/Product/product_view.dart';
import 'login_view.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Product List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListView()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => _handleLogout(context),
            ),
          ],
        ),
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
