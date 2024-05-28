// Import Flutter Material package untuk menggunakan widget dan komponen dari Flutter
import 'package:flutter/material.dart';
import '/model/poli.dart';
import 'poli_item.dart';
import 'poli_form.dart';

// Kelas PoliPage merupakan StatefulWidget untuk menampilkan halaman data poli
class PoliPage extends StatefulWidget {
  // Konstruktor untuk PoliPage
  const PoliPage({Key? key}) : super(key: key);

  // Membuat state baru untuk PoliPage
  @override
  State<PoliPage> createState() => _PoliPageState();
}

// Kelas _PoliPageState merupakan state dari PoliPage
class _PoliPageState extends State<PoliPage> {
  // Metode build untuk menampilkan tampilan halaman data poli
  @override
  Widget build(BuildContext context) {
    // Mengembalikan scaffold yang berisi halaman data poli
    return Scaffold(
      // Menampilkan app bar dengan judul "Data Poli"
      appBar: AppBar(
        title: const Text("Data Poli"),
        // Menambahkan tombol tambah untuk menampilkan formulir penambahan poli
        actions: [
          GestureDetector(
            // Menampilkan icon tambah
            child: Container(
                padding: EdgeInsets.only(right: 20.0),
                margin: EdgeInsets.all(20.0),
                child: Icon(Icons.add)),
            // Menetapkan aksi untuk menavigasi ke halaman PoliForm saat tombol tambah ditekan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PoliForm()),
              );
            },
          )
        ],
      ),
      // Menampilkan ListView untuk menampilkan daftar poli
      body: ListView(
        children: [
          // Menampilkan item poli untuk setiap poli dalam daftar
          PoliItem(poli: Poli(namaPoli: "Poli Anak")),
          PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
          PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
          PoliItem(poli: Poli(namaPoli: "Poli THT")),
        ],
      ),
    );
  }
}
