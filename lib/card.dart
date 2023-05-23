import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: new AppBar(title: new Text("Stateless Widget")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myCard(
                title: new Text("I love Flutter",
                    style: new TextStyle(fontSize: 20.0)),
                icon: new Icon(Icons.favorite,
                    size: 40.0, color: Colors.redAccent)),
            myCard(
                title: new Text("I love Donuts",
                    style: new TextStyle(fontSize: 20.0)),
                icon: new Icon(Icons.donut_large,
                    size: 40.0, color: Colors.brown)),
            myCard(
                title:
                    new Text("I see you", style: new TextStyle(fontSize: 20.0)),
                icon:
                    new Icon(Icons.visibility, size: 40.0, color: Colors.blue))
          ],
        ),
      ),
    );
  }
}

class myCard extends StatelessWidget {
  myCard({required this.title, required this.icon});

  final Widget title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Card(
        child: Container(
          child: Column(
            children: [this.title, this.icon],
          ),
        ),
      ),
    );
  }
}
