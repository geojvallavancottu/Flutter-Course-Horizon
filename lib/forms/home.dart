import 'package:flutter/material.dart';
import './add_task.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: "Add Task",
          backgroundColor: Color(0xFFe13535),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTask()));
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "My Tasks",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "2 of 5 tasks",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFcbcbcb),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  color: Color(0xFFcbcbcb),
                  height: 1,
                ),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      c1 = value;
                    });
                  },
                  value: c1,
                ),
                title: Text(
                  "Buy Milk",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Mon, Apr 30"),
              ),
              Dismissible(
                // secondaryBackground: Container(
                //   color: Colors.orange,
                //   child: Align(
                //     // alignment: Alignment.centerLeft,
                //     child: Icon(
                //       Icons.delete,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                key: Key('a'),
                child: ListTile(
                  leading: Checkbox(
                    onChanged: (bool value) {
                      setState(() {
                        c2 = value;
                      });
                    },
                    value: c2,
                  ),
                  title: Text(
                    "Publish Firday blog post",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("Mon, Apr 30"),
                ),
              ),
              ListTile(
                leading: SizedBox(),
                title: Text(
                  "Wash Cloths",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFe13535),
                  ),
                ),
                subtitle: Text("Mon, Apr 30"),
              ),
              ListTile(
                leading: Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      c4 = value;
                    });
                  },
                  value: c4,
                ),
                title: Text(
                  "Practice Flutter",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Mon, Apr 30"),
              ),
            ],
          ),
        ));
  }
}
