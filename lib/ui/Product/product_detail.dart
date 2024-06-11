import 'package:flutter/material.dart';
import '/model/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product.name}', style: TextStyle(fontSize: 18)),
            Text('Description: ${product.description}',
                style: TextStyle(fontSize: 18)),
            Text('Price: ${product.price}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
