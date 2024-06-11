import 'package:flutter/material.dart';

class Transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: TransactionScreen(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.business),
                onPressed: () {},
              ),
              SizedBox(width: 48.0), // Space for the FAB
              IconButton(
                icon: Icon(Icons.school),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        TransactionItem(
          name: 'Adaptor yuwell YE660B dc5v',
          price: 65000,
          quantity: 1,
          remaining: 1,
        ),
        TransactionItem(
          name: 'Alat bantu dengar SM 339',
          price: 169000,
          quantity: 1,
          remaining: 1,
        ),
        // Add more items here
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;
  final int remaining;

  TransactionItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(name[0]),
        ),
        title: Text(name),
        subtitle: Text('Rp $price'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('sisa $remaining'),
            Text('Rp ${price * quantity}'),
          ],
        ),
      ),
    );
  }
}
