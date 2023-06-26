import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import '../../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      if (data.nama != null) {
        _namaCtrl.text = data.nama != null ? data.nama : '';
        _nipCtrl.text = data.nip != null ? data.nip : '';

        _tanggalLahirCtrl.text = data.tanggalLahir != null
            ? data.tanggalLahir.toString().substring(0, 10)
            : '';
        _nomorTeleponCtrl.text =
            data.nomorTelepon != null ? data.nomorTelepon : '';
        _emailCtrl.text = data.email != null ? data.email : '';
      }
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildNamaField(),
              _buildNIPField(),
              _buildTanggalLahirField(),
              _buildNomorTeleponField(),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildSimpanButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNamaField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaCtrl,
    );
  }

  Widget _buildNIPField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nipCtrl,
    );
  }

  Widget _buildTanggalLahirField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: " ddTanggal Lahir"),
      controller: _tanggalLahirCtrl,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              final formattedDate = selectedDate
                  .toLocal()
                  .toString()
                  .split(' ')[0]; // get the date part only
              _tanggalLahirCtrl.text = formattedDate;
            });
          }
        });
      },
      readOnly: true,
    );
  }

  Widget _buildNomorTeleponField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
    );
  }

  Widget _buildSimpanButton() {
    return ElevatedButton(
      onPressed: () async {
        Pegawai pegawai = Pegawai(
          nama: _namaCtrl.text,
          nip: _nipCtrl.text,
          tanggalLahir: DateTime.parse(_tanggalLahirCtrl.text),
          nomorTelepon: _nomorTeleponCtrl.text,
          email: _emailCtrl.text,
        );

        String id = widget.pegawai.id.toString();
        await PegawaiService().ubah(pegawai, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
