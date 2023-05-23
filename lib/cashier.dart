import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CashierScreen extends StatefulWidget {
  @override
  _CashierScreenState createState() => _CashierScreenState();
}

// class _CashierScreenState extends State<CashierScreen> {
//   final List<Map<String, dynamic>> _products = [
//     {
//       'name': 'Product 1',
//       'price': 10.0,
//     },
//     {
//       'name': 'Product 2',
//       'price': 20.0,
//     },
//     {
//       'name': 'Product 3',
//       'price': 30.0,
//     },
//   ];

class _CashierScreenState extends State<CashierScreen> {
  List<Map<String, dynamic>> _products = [];
  bool _isExpanded = false;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    // Make a dummy API call to fetch the products data
    String apiUrl =
        'https://fakestoreapi.com/products?limit=20&page=$_currentPage';
    var response = await http.get(Uri.parse(apiUrl));

    // Parse the JSON response and update the _products list
    var data = jsonDecode(response.body);
    setState(() {
      _products = List<Map<String, dynamic>>.from(data.map((product) => {
            'title': product['title'],
            'price': product['price'],
          }));
    });
  }

  // final List<Map<String, dynamic>> _products = [];

  final List<Map<String, dynamic>> _cartItems = [];

  double get _totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item['price']);
  }

  void _addToCart(int index) {
    final product = _products[index];
    setState(() {
      _cartItems.add({
        'title': product['title'],
        'price': product['price'],
      });
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashier App'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Product list
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return ListTile(
                      title: Text(product['title']),
                      subtitle: Text('\$${product['price']}'),
                      trailing: ElevatedButton(
                        onPressed: () => _addToCart(index),
                        child: Text('Add to Cart'),
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              // Cart items list
              if (_isExpanded)
                Expanded(
                  child: ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return ListTile(
                        title: Text(item['title']),
                        subtitle: Text('\$${item['price']}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => _removeFromCart(index),
                        ),
                      );
                    },
                  ),
                ),
              // Total price
              Divider(),
              ListTile(
                title: Text('Total Price:'),
                subtitle: Text('\$$_totalPrice'),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Slider(
              value: _isExpanded ? 1 : 0,
              onChanged: (value) {
                setState(() {
                  _isExpanded = value.round() == 1;
                });
              },
              min: 0,
              max: 1,
              divisions: 1,
              label: _isExpanded ? 'Hide Cart' : 'Show Cart',
            ),
          ),
        ],
      ),
    );
  }
}
