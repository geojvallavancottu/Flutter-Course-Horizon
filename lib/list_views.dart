import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  final List names = ["Geo", "John", "James"];
  ListViews({Key key}) : super(key: key);

  // if()        output else ouput
  // condition ? output : output

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Views Demo"),
      ),
      body: names.length > 0
          ? ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      "assets/download.png",
                    ),
                  ),
                  title: Text(
                    "${names[index]}",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("example.com"),
                  trailing: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                  onTap: (){
                    print("tapped");
                  },
                );
              },
              itemCount: names.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            )
          : Center(
              child: Text(
                "Sorry the list is empty",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
    );
  }

  // Listview Builder Example

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("List Views Demo"),
  //     ),
  //     body: names.length > 0
  //         ? ListView.separated(
  //             itemBuilder: (BuildContext context, int index) {
  //               return Container(
  //                 height: 50,
  //                 child: Text(
  //                   "Hi ${names[index]}",
  //                   style: TextStyle(fontSize: 20),
  //                 ),
  //               );
  //             },
  //             itemCount: names.length,
  //             separatorBuilder: (BuildContext context, int index) { return Divider(); },
  //             // separatorBuilder: (BuildContext context, int index) {
  //             //   return Container(
  //             //     height: 2,
  //             //   //  child: Text("Seperator $index"),
  //             //     color: Colors.black,
  //             //   );
  //             // },
  //           )
  //         : Center(
  //             child: Text(
  //               "Sorry the list is empty",
  //               style: TextStyle(fontSize: 20, color: Colors.red),
  //             ),
  //           ),
  //   );
  // }

  // Listview Builder Example

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("List Views Demo"),
  //     ),
  //     body: names.length > 0
  //         ? ListView.builder(
  //             itemBuilder: (BuildContext context, int index) {
  //               return
  //               Container(
  //                 height:50,
  //                 child: Text(
  //                   "Hi ${names[index]}",
  //                   style: TextStyle(fontSize: 20),
  //                 ),
  //               );
  //             },
  //             itemCount: names.length,
  //           )
  //         : Center(
  //             child: Text(
  //               "Sorry the list is empty",
  //               style: TextStyle(fontSize: 20, color: Colors.red),
  //             ),
  //           ),
  //   );
  // }
}
