import 'package:flutter/material.dart';
import '../../model/produk.dart';
import '../../service/produk_service.dart';
import 'package:file_picker/file_picker.dart';
import 'produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaProdukCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();
  final _imgCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Produk")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaProduk(),
              _fieldStok(),
              _fieldImg(),
              _fieldHarga(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaProduk() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Produk harus diisi';
        }
        return null;
      },
    );
  }

  _fieldStok() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Stok"),
      controller: _stokCtrl,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Stok harus diisi';
        }
        return null;
      },
    );
  }

  _fieldImg() {
    return ElevatedButton(
      onPressed: _selectImage,
      child: const Text('Select Image'),
    );
  }

  void _selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      String? imagePath = result.files.single.path;
      setState(() {
        _imgCtrl.text = imagePath ?? '';
      });
    }
  }

  _fieldHarga() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaCtrl,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harga harus diisi';
        }
        return null;
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          Produk produk = Produk(
            nama_produk: _namaProdukCtrl.text,
            stok: int.parse(_stokCtrl.text),
            img: _imgCtrl.text,
            harga: _hargaCtrl.text,
          );

          await ProdukService().simpan(produk).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukDetail(produk: value),
              ),
            );
          });
        }
      },
      child: const Text("Simpan"),
    );
  }
}
