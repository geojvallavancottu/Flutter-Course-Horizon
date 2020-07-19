import 'package:flutter/material.dart';

main() {
  print("Hello");
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          children: <Widget>[
            Start("Geo"),
            Start("Jacob"),
            Start("James"),
          ],
        ),
      ),
    ),
  );
}

class Start extends StatelessWidget {
  final String text;

  Start(this.text);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello $text",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}

