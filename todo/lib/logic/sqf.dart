import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqf {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialization();
    } else {
      return _db;
    }
  }
  Future<Database> intialization() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'hamada.db');
    Database mydb = await openDatabase(path, onCreate: _oncreate, version: 1);
    return mydb;
  }
  Future<void> _oncreate(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE "notes" ( 
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT NOT NULL, 
      subtitle TEXT NOT NULL, 
      description TEXT NOT NULL
      )
      ''');
      print("Databasse Create ==============================> Done");
    } catch (e) {
      print("ERROR  OCCURES:$e");
    }
  }

  Future<List<Map<String, dynamic>>> readDate(String sql) async {
    Database? mydb = await db;
    try {
      List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
      return response;
    } catch (e) {
      print("Error Reading data :$e");
      return [];
    }
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    try {
      int response = await mydb!.rawInsert(sql);
      return response;
    } catch (e) {
      print("Error insertind data :$e");
      return 0;
    }
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    try {
      int response = await mydb!.rawUpdate(sql);
      return response;
    } catch (e) {
      print("Error  update data :$e");
      return 0;
    }
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    try {
      int response = await mydb!.rawDelete(sql);
      return response;
    } catch (e) {
      print("Error  deleting data :$e");
      return 0;
    }
  }
}
