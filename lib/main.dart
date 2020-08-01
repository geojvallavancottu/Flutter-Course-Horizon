// import 'dart:html';

import 'package:first_app/external/user.dart';

// import './forms/profile.dart';
import 'package:flutter/material.dart';
// import './example/my_widgets.dart';
// import 'list_views.dart';
// import 'navigation/screen_one.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyStateFulWidget(),
      // home: MyWidgets(),
      // home: ListViews(),
      // home: ScreenOne(),
      // home: Profile(),
      home: User(),
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

class MyStateFulWidget extends StatefulWidget {
  MyStateFulWidget({Key key}) : super(key: key);

  @override
  _MyStateFulWidgetState createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StateFull Wdiget"),
      ),
      body: Center(
        child: Text(
          "You have tapped $counter times",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
          print(counter);
        },
      ),
    );
  }
}
