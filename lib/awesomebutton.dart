import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int counter = 0;
  List<String> strings = ['Flutter', 'is', 'awesome'];
  String yangmuncul = "";

  void onPressed() {
    setState(() {
      yangmuncul = strings[counter];
      counter = counter < 2 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(yangmuncul,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: new Text(
                  "Press me!",
                  style: new TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
                onPressed: onPressed)
          ],
        )),
      ),
    );
  }
}
