
import 'package:flutterproject/entities/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //tạo obj từ private Constructor
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  final String dbName = "student_db.db";
  final String tbStudent = "studentTb";
  final String columnId = "id";
  final String columnName = "name";
  final String columnPhone = "phone";
  final String columnAddress = "address";

  void _onCreate(Database db, int newVersion) async {
    await db.execute("crate table $tbStudent ("
          "$columnId integer primary key autoincrement,"
          "$columnName text, "
          "$columnPhone text, "
          "$columnAddress text, "
        ")");
  }

  Future<int?> create(Student student) async {
    var dbClient = await db;
    var result = await dbClient?.insert(tbStudent, student.toJson());
    return result;
  }

}