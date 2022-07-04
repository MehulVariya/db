import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sql/database/dabase_page/sqflite_page.dart';

import '../table_database/student.dart';

class MyDBHelper extends SqflitePage {
  static final MyDBHelper instance = MyDBHelper._init();

  MyDBHelper._init() {}

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('collage.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''create table $tableName(
      ${StudentField.id} int primary key autoincrement,
      ${StudentField.name} text,
      ${StudentField.number} text
      )''');
  }

  Future<Student> create(Student student) async {
    final db = await instance.database;
    final id = await db?.insert(tableName, student.toMap());
    return student.copy(id:id);
  }
  Future<Student?> readData(int id) async{
    final db = await instance.database;
    final maps = await db!.query(tableName,columns: StudentField.values,where: '${StudentField.id}=?',whereArgs: [id]);
    if(maps.isNotEmpty){
      return Student.mapFromObject(maps.first);
    }
    else{
      return null;
    }
  }
  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
