import 'package:flutter/material.dart';
import 'package:klinik_mobile_apps/model/poli.dart';
import '../../model/pegawai.dart';
import '../../model/pasien.dart';
import 'pegawai_detail.dart';
import '../pasien/pasien_detail.dart';
import 'pegawai_item.dart';
import '../pasien/pasien_item.dart';
import '../poli/poli_item.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data RS"),
        actions: [
          GestureDetector(
            child: Container(
              child: const Icon(Icons.add),
              padding: EdgeInsets.all(20),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(pegawai: Pegawai(namaPegawai: "Pegawai")),
          PasienItem(pasien: Pasien(namaPasien: "Pasien")),
          PoliItem(poli: Poli(namaPoli: "Poli")),
        ],
      ),
    );
  }
}
