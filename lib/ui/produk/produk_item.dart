import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/produk_detail.dart';
import '../model/produk.dart';

class ProdukItem extends StatelessWidget {
  final Produk produk;

  const ProdukItem({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${produk.nama_produk}"),
          trailing: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://0181-103-164-115-58.ngrok-free.app/img/${produk.img}'),
            radius: 16,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(produk: produk),
          ),
        );
      },
    );
  }
}
