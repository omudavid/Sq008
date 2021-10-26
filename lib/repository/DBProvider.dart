import 'dart:io';
import 'package:flutter_class/repository/student.dart';
import 'package:flutter_class/repository/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    /// Get path to which you want to write the database
    var dir = await getDatabasesPath();
    var path = dir;
    var databasePath = join(path, 'myDatabase.db');

    if (await Directory(dirname(databasePath)).exists()) {
    } else {
      await Directory(dirname(databasePath)).create(recursive: true);
    }

    return await openDatabase(databasePath, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE students (
      id TEXT PRIMARY KEY,
      name TEXT
      )
      ''');
    }, version: 1, onUpgrade: (db, oldVersion, newVersion) async {});
  }

  Future<int> addToDatabase(Student student) async {
    final db = await database;
    print(database);
    var res = await db!.insert('students', student.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final res = await db?.query('students');
    if (res!.isEmpty) {
      return [];
    } else {
      return res.map((e) => Student.fromJson(e)).toList();
    }

    //var res = await db!.query('students',where: 'id= ?', whereArgs: ['1'])
  }
}
