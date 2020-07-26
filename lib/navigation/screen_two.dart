import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Two"),
        // automaticallyImplyLeading: false,
      ),
      drawer: Drawer(),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Navigate back To Screen One"),
        ),
      ),
    );
  }
}
