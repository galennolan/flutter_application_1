import 'package:flutter/material.dart';
import '/model/poli.dart'; // Mengimport model Poli
import 'poli_detail.dart'; // Mengimport UI PoliDetail

class PoliUpdateForm extends StatefulWidget {
  final Poli poli; // Deklarasi variabel poli

  const PoliUpdateForm({Key? key, required this.poli})
      : super(key: key); // Konstruktor untuk PoliUpdateForm
  _PoliUpdateFormState createState() =>
      _PoliUpdateFormState(); // Menginisialisasi state untuk PoliUpdateForm
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>(); // Membuat GlobalKey untuk Form
  final _namaPoliCtrl =
      TextEditingController(); // Membuat TextEditingController untuk nama poli

  @override
  void initState() {
    super.initState();
    setState(() {
      _namaPoliCtrl.text =
          widget.poli.namaPoli; // Mengatur nilai teks dari nama poli pada form
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              "Ubah Poli")), // Menampilkan judul "Ubah Poli" pada AppBar
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Mengatur GlobalKey pada Form
          child: Column(
            children: [
              _fieldNamaPoli(),
              SizedBox(height: 20),
              _tombolSimpan()
            ], // Menampilkan field nama poli dan tombol simpan
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    // Method untuk menampilkan field nama poli
    return TextField(
      decoration: const InputDecoration(
          labelText:
              "Nama Poli"), // Mendefinisikan label "Nama Poli" untuk TextField
      controller:
          _namaPoliCtrl, // Menghubungkan controller dengan TextEditingController
    );
  }

  Widget _tombolSimpan() {
    // Method untuk menampilkan tombol simpan
    return ElevatedButton(
      onPressed: () {
        // Aksi yang akan dijalankan ketika tombol ditekan
        Poli poli = Poli(
            namaPoli: _namaPoliCtrl
                .text); // Membuat objek Poli baru dengan nama poli dari TextField
        Navigator.pop(context); // Menutup halaman update Poli
        Navigator.pushReplacement(
          // Navigasi ke halaman PoliDetail
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
      },
      child: const Text(
          "Simpan Perubahan"), // Menampilkan teks "Simpan Perubahan" pada tombol
    );
  }
}
