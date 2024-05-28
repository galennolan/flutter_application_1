import 'package:flutter/material.dart';
import 'poli_update_form.dart'; // Mengimport PoliUpdateForm
import '/model/poli.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli; // Deklarasi variabel poli

  const PoliDetail({Key? key, required this.poli})
      : super(key: key); // Konstruktor untuk PoliDetail

  @override
  State<PoliDetail> createState() =>
      _PoliDetailState(); // Menginisialisasi state untuk PoliDetail
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Detail Poli")), // Menampilkan judul "Detail Poli" pada AppBar
      body: Column(
        // Menampilkan konten dalam bentuk kolom
        children: [
          // Menampilkan elemen-elemen berikut dalam kolom
          SizedBox(
              height: 20), // Spacer kosong untuk memberi jarak antara elemen
          Text(
            // Menampilkan teks dengan nama poli
            "Nama Poli : ${widget.poli.namaPoli}", // Mendapatkan nama poli dari widget
            style: TextStyle(fontSize: 20), // Mengatur gaya teks
          ),
          SizedBox(
              height: 20), // Spacer kosong untuk memberi jarak antara elemen
          Row(
            // Menampilkan tombol ubah dan hapus dalam satu baris
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Menyusun tombol dengan jarak yang sama di sepanjang baris
            children: [
              // Menampilkan elemen-elemen berikut dalam baris
              _tombolUbah(), // Memanggil method untuk menampilkan tombol ubah
              _tombolHapus(), // Memanggil method untuk menampilkan tombol hapus
            ],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    // Method untuk menampilkan tombol ubah
    return ElevatedButton(
      onPressed: () {
        // Aksi yang akan dijalankan ketika tombol ditekan
        Navigator.push(
          // Navigasi ke halaman PoliUpdateForm
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PoliUpdateForm(poli: widget.poli)), // Mengirimkan data poli
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors
              .green), // Mengatur warna latar belakang tombol menjadi hijau
      child: const Text("Ubah"), // Menampilkan teks "Ubah" pada tombol
    );
  }

  _tombolHapus() {
    // Method untuk menampilkan tombol hapus
    return ElevatedButton(
      onPressed:
          () {}, // Belum ditentukan aksi yang akan dilakukan saat tombol ditekan
      style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.red), // Mengatur warna latar belakang tombol menjadi merah
      child: const Text("Hapus"), // Menampilkan teks "Hapus" pada tombol
    );
  }
}
