import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  bool isLoading = true;
  var users = [];
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future getUsers() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
    setState(() {
      users = json.decode(response.body);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/download.png"),
                  ),
                  title: Text(users[index]["name"]),
                  subtitle: Text(users[index]["email"]),
                  trailing: Icon(Icons.phone),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: users.length),
    );
  }
}
