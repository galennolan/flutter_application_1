import 'package:flutter/material.dart';
import '/model/pasien.dart';
import 'pasien_update_form.dart';
import 'pasien_page.dart';
import '/controller/pasien_service.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  // Fungsi untuk memformat tanggal agar lebih mudah dibaca
  String formatDate(String date) {
    return date; // Asumsikan tanggal sudah dalam format yang benar
  }

  @override
  void initState() {
    super.initState();
    // Debug log untuk memeriksa data yang diterima
    print("Nama: ${widget.pasien.nama}");
    print("No Rekam Medis: ${widget.pasien.noRm}");
    print("Tanggal Lahir: ${widget.pasien.tanggalLahir}");
    print("Nomor Telepon: ${widget.pasien.nomorTelepon}");
    print("Alamat: ${widget.pasien.alamat}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:
          _onBackPressed, // Memastikan tindakan saat tombol kembali ditekan
      child: Scaffold(
        appBar: AppBar(title: const Text("Detail Pasien")),
        body: Column(
          children: [
            const SizedBox(height: 50), // Jarak atas
            // Menampilkan detail pasien dalam bentuk baris dan kolom
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(textAlign: TextAlign.left, 'Nama'),
                    Text(textAlign: TextAlign.left, 'No Rekam Medis'),
                    Text(textAlign: TextAlign.left, 'Tanggal Lahir'),
                    Text(textAlign: TextAlign.left, 'Nomor Telepon'),
                    Text(textAlign: TextAlign.left, 'Alamat')
                  ],
                ),
                Column(children: const [
                  Text(' : '),
                  Text(' : '),
                  Text(' : '),
                  Text(' : '),
                  Text(' : ')
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.pasien.nama}"),
                    Text("${widget.pasien.noRm}"),
                    Text(
                      formatDate(widget.pasien.tanggalLahir),
                    ),
                    Text("${widget.pasien.nomorTelepon}"),
                    Text("${widget.pasien.alamat}"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50), // Jarak bawah
            // Menampilkan tombol untuk mengubah dan menghapus data pasien
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tombolUbah(),
                _tombolHapus(),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Fungsi yang dipanggil saat tombol kembali ditekan
  Future<bool> _onBackPressed() async {
    // Memuat ulang halaman sebelumnya saat navigasi kembali
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PasienPage()),
    );
    return true; // Izinkan navigasi kembali
  }

  // Widget tombol untuk mengubah data pasien
  Widget _tombolUbah() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasienUpdateForm(pasien: widget.pasien),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text("Ubah"),
    );
  }

  // Widget tombol untuk menghapus data pasien
  Widget _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await PasienService()
                      .hapus(widget.pasien.id.toString())
                      .then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasienPage(),
                      ),
                    );
                  });
                } catch (e) {
                  print('Error: $e');
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Gagal menghapus data"),
                  ));
                }
              },
              child: const Text("YA"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
