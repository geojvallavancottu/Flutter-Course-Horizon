import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';
import '../models/task.dart';

class DBHelper {
  static Database _db;

  // tables fields
  static const String ID = 'id';
  static const String TASKNAME = 'taskname';
  static const String TASKDATE = 'taskdate';
  static const String ISCOMPLETED = 'iscompleted';

  static const String TABLE = 'Task';
  static const String DB_NAME = 'task.db'; // must .db extension

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $TASKNAME TEXT,$TASKDATE TEXT, $ISCOMPLETED BIT)");
  }

  Future<Task> save(Task task) async {
    var dbClient = await db;
    task.id = await dbClient.insert(TABLE, task.toMap());
    print(task.id);
    return task;
  }

  Future<List<Task>> getTasks() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: [ID, TASKNAME, TASKDATE, ISCOMPLETED]);
    List<Task> tasks = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        tasks.add(Task.fromMap(maps[i]));
      }
    }
    return tasks;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(Task task) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, task.toMap(), where: '$ID = ?', whereArgs: [task.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<int> countInCompleted() async {
    var dbClient = await db;
    int val = 0;
    var count = await dbClient
        .rawQuery("SELECT COUNT(*) FROM $TABLE WHERE $ISCOMPLETED = $val");
    return Sqflite.firstIntValue(count);
  }

  Future<int> totalTasks() async {
    var dbClient = await db;
    var count = await dbClient.rawQuery("SELECT COUNT(*) FROM $TABLE");
    print(count);
    return Sqflite.firstIntValue(count);
  }
}
