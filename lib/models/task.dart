class Task {
  int id, iscompleted;
  String taskname, taskdate;

  Task(this.id, this.taskname, this.taskdate, this.iscompleted);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "taskname": taskname,
      "taskdate": taskdate,
      "iscompleted": iscompleted,
    };
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    taskname = map['taskname'];
    taskdate = map['taskdate'];
    iscompleted = map['iscompleted'];
  }
}
