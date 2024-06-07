import 'package:flutter/material.dart';

import 'Barang.dart';

class Manajemen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manajemen'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Barang atau jasa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Barang()), // Ganti dengan halaman yang sesuai
              );
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Kategori barang'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Manajemen stok'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Pembelian Barang'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Pelanggan dan Supplier'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Hutang dan Piutang'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Diskon, Pajak, dan Biaya'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.inventory_2),
            title: Text('Stok Opname'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Marketing'),
            onTap: () {
              // Aksi yang diinginkan saat di-tap
            },
          ),
        ],
      ),
    );
  }
}
