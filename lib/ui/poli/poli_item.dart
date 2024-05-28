// Mengimpor paket yang diperlukan
import 'package:flutter/material.dart';

// Mengimpor definisi dan implementasi kelas Poli dari file poli.dart
import '/model/poli.dart';

// Mengimpor halaman detail poli dari file poli_detail.dart
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;

  // Konstruktor untuk kelas PoliItem
  const PoliItem({Key? key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Menggunakan GestureDetector untuk mendeteksi interaksi pengguna
      child: Card(
        // Menggunakan Card untuk membuat kotak dengan bayangan
        child: ListTile(
          // Menggunakan ListTile untuk membuat tampilan item poli dalam bentuk daftar
          title: Text("${poli.namaPoli}"), // Menampilkan teks nama poli
        ),
      ),
      onTap: () {
        // Aksi saat item poli ditekan/ditap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PoliDetail(
                poli:
                    poli), // Navigasi ke halaman detail poli dengan memberikan data poli
          ),
        );
      },
    );
  }
}
