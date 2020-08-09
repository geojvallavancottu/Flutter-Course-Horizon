import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../forms/home.dart';
import '../database/db_helper.dart';
import '../models/task.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskname, taskdate;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var date;
  var dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    dbHelper.getTasks();
  }

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (picked != null) {
      setState(() {
        date = DateFormat(
          "EEE, MMM dd",
        ).format(picked);
      });
      controller.text = date;
    }
  }

  submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Task t = Task(null, taskname, taskdate, 0);
      dbHelper.save(t);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      // dbHelper.getTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Task Name",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Your task name"),
                      validator: (arg) {
                        if (arg.length == 0) {
                          return 'Please enter task name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (input) => taskname = input,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Date",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    InkWell(
                      onTap: selectDate,
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(hintText: "Choose date"),
                          validator: (arg) {
                            if (arg.length == 0) {
                              return 'Please choose a date';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) => taskdate = input,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.orange,
                          child: Text("Add Task",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          onPressed: submit,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
