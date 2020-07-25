import 'package:flutter/material.dart';

class MyWidgets extends StatelessWidget {
  const MyWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgtes"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.yellow,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Image.network(
            "https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png",
            width: 75,
            height: 75,
          ),
          Image.asset(
            "assets/download.png",
            width: 75,
            height: 75,
          ),
          Card(
            // // color: Colors.get,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "I am Card",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Card(
            // // color: Colors.get,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "I am Card 2",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Container Widget

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Widgtes"),
  //     ),
  //     body: Container(
  //       width: 75,
  //       height: 75,
  //       decoration: BoxDecoration(
  //         // borderRadius: BorderRadius.circular(50),
  //         // borderRadius: BorderRadius.only(
  //         //   bottomLeft: Radius.circular(20.0),
  //         //   topLeft: Radius.circular(50),
  //         //   topRight: Radius.circular(30),
  //         //   bottomRight: Radius.circular(70),
  //         // ),
  //         // gradient: LinearGradient(colors: [Colors.red,Colors.yellow]),
  //         color: Colors.blue,
  //       ),
  //       // width:MediaQuery.of(context).size.width / 2,
  //       // height:MediaQuery.of(context).size.height / 2,
  //       // padding: EdgeInsets.all(20),
  //       padding: EdgeInsets.only(left: 25),
  //       // margin: EdgeInsets.only(left: 25, top: 30),
  //       // color: Color(0xFFa84432), //For custom color
  //       // color: Colors.blue, //For Materual predefined color
  //       child: Text(
  //         "Container",
  //         style: TextStyle(fontSize: 10, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
