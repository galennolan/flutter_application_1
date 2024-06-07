import 'package:flutter/material.dart';
import 'Manajemen.dart';
import 'transaksi.dart';
import 'sales_chart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: Center(child: Text('Content Area')),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF04389E),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Text(
                    'JA',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Joyo Alkes',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  'Owner',
                  style: TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Billing on 06 Jul 2024',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Manajemen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Manajemen()), // Ganti dengan halaman yang sesuai
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Transaksi Penjualan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Transaksi()), // Ganti dengan halaman yang sesuai
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Keuangan'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.payments),
            title: Text('PPOB'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Laporan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalesChart()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Absensi'),
            trailing: Text(
              'Baru!',
              style: TextStyle(color: Colors.orange),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Shift'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Referral'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
