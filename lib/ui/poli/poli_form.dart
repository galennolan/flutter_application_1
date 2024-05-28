import 'package:flutter/material.dart'; // Import library Flutter untuk pengembangan UI
import '/model/poli.dart'; // Import model Poli
import 'poli_detail.dart'; // Import UI PoliDetail

class PoliForm extends StatefulWidget {
  // Deklarasi kelas PoliForm sebagai StatefulWidget
  const PoliForm({Key? key}) : super(key: key); // Konstruktor untuk PoliForm

  @override
  _PoliFormState createState() =>
      _PoliFormState(); // Membuat instance dari _PoliFormState
}

class _PoliFormState extends State<PoliForm> {
  // Deklarasi kelas _PoliFormState sebagai State dari PoliForm
  final _formKey =
      GlobalKey<FormState>(); // GlobalKey untuk mengelola state dari form
  final _namaPoliCtrl =
      TextEditingController(); // TextEditingController untuk mengelola input dari field nama poli

  @override
  Widget build(BuildContext context) {
    // Metode untuk membangun tampilan form
    return Scaffold(
      // Scaffold sebagai layout utama
      appBar: AppBar(
          title:
              const Text("Tambah Poli")), // AppBar dengan judul "Tambah Poli"
      body: SingleChildScrollView(
        // SingleChildScrollView untuk membuat tampilan scrollable
        child: Form(
          // Form sebagai wadah untuk field input
          key: _formKey, // Menggunakan GlobalKey untuk form
          child: Column(
            // Column sebagai wadah untuk menampilkan widget secara vertikal
            children: [
              _fieldNamaPoli(),
              SizedBox(height: 20),
              _tombolSimpan()
            ], // Menampilkan field input nama poli dan tombol simpan
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    // Metode untuk menampilkan field input nama poli
    return TextField(
      // TextField untuk input teks
      decoration: const InputDecoration(
          labelText: "Nama Poli"), // Dekorasi field input nama poli
      controller:
          _namaPoliCtrl, // Menggunakan TextEditingController untuk mengelola input
    );
  }

  Widget _tombolSimpan() {
    // Metode untuk menampilkan tombol simpan
    return ElevatedButton(
      // ElevatedButton sebagai tombol dengan latar belakang yang ditinggikan
      onPressed: () {
        // Ketika tombol ditekan
        Poli poli = Poli(
            namaPoli: _namaPoliCtrl
                .text); // Membuat objek Poli dengan data dari input nama poli
        Navigator.pushReplacement(
          // Melakukan navigasi ke halaman PoliDetail dengan membawa data poli
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
      },
      child: const Text("Simpan"), // Teks pada tombol simpan
    );
  }
}
