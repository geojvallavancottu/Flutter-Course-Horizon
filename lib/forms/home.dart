import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import '../database/db_helper.dart';
import './add_task.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int taskInCompleted, totalTasks;
  var dbHelper;
  bool isTaskLoding = true;
  Future<List<Task>> tasks;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    getAllTasks();
  }

  getAllTasks() async {
    setState(() {
      isTaskLoding = true;
    });
    int total = await dbHelper.totalTasks();
    int incompleted = await dbHelper.countInCompleted();
    setState(() {
      tasks = dbHelper.getTasks();
      taskInCompleted = incompleted;
      totalTasks = total;
      isTaskLoding = false;
    });
  }

  Dismissible buildTaskWidget(Task task) {
    return Dismissible(
      onDismissed: (direction) {
        dbHelper.delete(task.id);
        getAllTasks();
      },
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
      key: Key("${task.id}"),
      child: ListTile(
        onTap: () {
          if (task.iscompleted == 1) {
            Task t = Task(task.id, task.taskname, task.taskdate, 0);
            dbHelper.update(t);
            getAllTasks();
          } else if (task.iscompleted == 0) {
            Task t = Task(task.id, task.taskname, task.taskdate, 1);
            dbHelper.update(t);
            getAllTasks();
          }
        },
        leading: task.iscompleted == 0
            ? Icon(Icons.check_box_outline_blank)
            : SizedBox(),
        title: Text(
          "${task.taskname}",
          style: task.iscompleted == 0
              ? TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              : TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
        ),
        subtitle: Text("${task.taskdate}"),
      ),
    );
  }

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
                  "$taskInCompleted of $totalTasks tasks",
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
              // buildTaskWidget(),
              isTaskLoding
                  ? Center(
                      child: SizedBox(),
                    )
                  : FutureBuilder<List<Task>>(
                      future: tasks,
                      builder: (context, snapshot) {
                        if (snapshot.data == null ||
                            snapshot.data.length == 0) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("NO TASKS ADDED"),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data
                                .map((task) => buildTaskWidget(task))
                                .toList(),
                          );
                        }
                        return Container();
                      },
                    ),
            ],
          ),
        ));
  }
}
