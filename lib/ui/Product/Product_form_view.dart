import 'package:flutter/material.dart';
import '/model/product_model.dart';
import '/controller/product_controller.dart';
import 'product_detail.dart';

class ProductFormView extends StatefulWidget {
  final Product? product;

  const ProductFormView({Key? key, this.product}) : super(key: key);

  @override
  _ProductFormViewState createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!.name ?? '';
      _descriptionController.text = widget.product!.description ?? '';
      _priceController.text = widget.product!.price?.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? "Tambah Product" : "Edit Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldName(),
                _fieldDescription(),
                _fieldPrice(),
                SizedBox(height: 20),
                _loading ? CircularProgressIndicator() : _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Name"),
      controller: _nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        return null;
      },
    );
  }

  Widget _fieldDescription() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Description"),
      controller: _descriptionController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a description';
        }
        return null;
      },
    );
  }

  Widget _fieldPrice() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Price"),
      controller: _priceController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a price';
        }
        try {
          int.parse(value);
        } catch (e) {
          return 'Please enter a valid price';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: _loading ? null : _handleSave,
      child: const Text("Simpan"),
    );
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _loading = true;
    });

    Product product = Product(
      id: widget.product?.id,
      name: _nameController.text,
      description: _descriptionController.text,
      price: int.parse(_priceController.text),
    );

    try {
      if (widget.product == null) {
        print('Attempting to save new product');
        final savedProduct = await ProductService().simpan(product);
        print('Product saved successfully: ${savedProduct.id}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: savedProduct),
          ),
        );
      } else {
        print('Attempting to update product with ID: ${product.id}');
        final updatedProduct =
            await ProductService().ubah(product, product.id!);
        print('Product updated successfully: ${updatedProduct.id}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: updatedProduct),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving product: $e')),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}
