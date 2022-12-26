import 'package:sqflite/sqlite_api.dart';

import 'db_helper.dart';
import '../models/user.dart';
import 'constants.dart';

class DatabaseTable {
  static const createTable = '''
    CREATE TABLE ${Constant.tableName} (
      id INTEGER PRIMARY KEY,
      name TEXT
    );
  ''';

  static const dropTable = '''
    DROP TABLE IF EXISTS ${Constant.tableName}
  ''';

  Future<int> insertUser(User user) async {
    var dbClient = DatabaseHelper().database;
    // final Database? dbClient = DatabaseHelper().database;
    return dbClient!.insert(
        Constant.tableName, user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<void> deleteUser(User user) async {
    // final Database? dbClient = DatabaseHelper().database;
    var dbClient = DatabaseHelper().database;
    await dbClient!.delete(
      Constant.tableName,
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }
  Future<List<User>> selectAllUsers() async {
    // final Database? dbClient = DatabaseHelper().database;
    var dbClient = DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await dbClient!.query(Constant.tableName);
    return List.generate(maps.length, (index) {
      return User(
        maps[index]['id'],
        maps[index]['name'],
      );
    });

  }
}