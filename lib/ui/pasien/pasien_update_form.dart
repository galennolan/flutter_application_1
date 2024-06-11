import 'package:flutter/material.dart';
import '/model/pasien.dart';
import 'pasien_detail.dart';
import '/controller/pasien_service.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();
  final _noRekamMedisCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _initFormData();
  }

  Future<void> _initFormData() async {
    _namaPasienCtrl.text = widget.pasien.nama;
    _noRekamMedisCtrl.text = widget.pasien.noRm;
    _tanggalLahirCtrl.text = widget.pasien.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaPasien(),
                _fieldNoRekamMedis(),
                _fieldTanggalLahir(),
                _fieldNomorTelepon(),
                _fieldAlamat(),
                const SizedBox(height: 20),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPasien() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }

  Widget _fieldNoRekamMedis() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "No Rekam Medis"),
      controller: _noRekamMedisCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a medical record number';
        }
        return null;
      },
    );
  }

  Widget _fieldTanggalLahir() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
      onTap: () async {
        DateTime initialDate;
        if (_tanggalLahirCtrl.text.isNotEmpty) {
          initialDate = DateTime.parse(_tanggalLahirCtrl.text);
        } else {
          initialDate = DateTime.now();
        }

        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          setState(() {
            _tanggalLahirCtrl.text =
                "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
          });
        }
      },
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a birth date';
        }
        return null;
      },
    );
  }

  Widget _fieldNomorTelepon() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        return null;
      },
    );
  }

  Widget _fieldAlamat() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an address';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: _loading ? null : _handleSave,
      child: _loading ? CircularProgressIndicator() : const Text("Simpan"),
    );
  }

  Future<void> _handleSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      try {
        Pasien pasien = Pasien(
          id: widget.pasien.id, // Use existing ID
          noRm: _noRekamMedisCtrl.text,
          nama: _namaPasienCtrl.text,
          tanggalLahir: _tanggalLahirCtrl.text, // Menggunakan String langsung
          nomorTelepon: _nomorTeleponCtrl.text,
          alamat: _alamatCtrl.text,
        );

        final savedPasien =
            await PasienService().ubah(pasien, pasien.id.toString());

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PasienDetail(pasien: savedPasien),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating pasien: $e')),
        );
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
