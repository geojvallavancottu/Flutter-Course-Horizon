import 'package:first_app/navigation/screen_two.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen One"),
      ),
      // endDrawer: Drawer(), // For right side
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30,),
            SizedBox(
              height: 150,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/download.png",
                    width: 75,
                    height: 75,
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text("Geo J Vallavancottu"),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenTwo(),
              ),
            );
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text("Users"),
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text("Contacts"),
            ),
          ],
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenTwo(),
              ),
            );
          },
          child: Text("Navigate To Screen Two"),
        ),
      ),
    );
  }
}
