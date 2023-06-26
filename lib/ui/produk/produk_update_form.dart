import 'package:flutter/material.dart';
import '../model/produk.dart';
import '../service/produk_service.dart';
import 'produk_detail.dart';

class ProdukUpdateForm extends StatefulWidget {
  final Produk produk;

  const ProdukUpdateForm({Key? key, required this.produk}) : super(key: key);

  @override
  _ProdukUpdateFormState createState() => _ProdukUpdateFormState();
}

class _ProdukUpdateFormState extends State<ProdukUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaProdukCtrl = TextEditingController();

  Future<Produk> getData() async {
    Produk data = await ProdukService().getById(widget.produk.id.toString());
    setState(() {
      if (data.nama_produk != null) {
        _namaProdukCtrl.text = data.nama_produk;
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
      appBar: AppBar(title: const Text("Ubah Produk")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaProduk(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Produk produk = Produk(
          id: widget.produk.id, // Keep the same ID as the original product
          nama_produk: _namaProdukCtrl.text,
          stok: widget.produk.stok,
          img: widget.produk.img,
          harga: widget.produk.harga,
        );
        String id = widget.produk.id.toString();
        await ProdukService().ubah(produk, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProdukDetail(produk: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
