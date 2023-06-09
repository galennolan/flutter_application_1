import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pegawai/pegawai_detail.dart';
import '../../model/pegawai.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  const PegawaiItem({Key? key, required this.pegawai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pegawai.nama}"),
          subtitle: Text("${pegawai.nip}"),
          trailing: const Icon(Icons.account_circle),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: pegawai)),
        );
      },
    );
  }
}
