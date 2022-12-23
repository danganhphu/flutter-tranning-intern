import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'constants.dart';
import 'db_table.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _db;
  Database? get database => _db;

  //danh sach cac query
  static const querys = [DatabaseTable.createTable];

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, Constant.dbName);
    _db= await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          querys.forEach((query) async => await db.execute(query));
        }
    );
  }
  final String columnId = "id";
  final String columnName = "name";

  void _onCreate(Database db, int newVersion) async {
    await db.execute("crate table ${Constant.tableName} ("
        "$columnId integer primary key autoincrement,"
        "$columnName text, "
        ")");
  }

}