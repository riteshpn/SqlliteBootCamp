import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;

  Database? _database;

  DbHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDb();
      return _database!;
    }
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'SampleDatabaseTesting.db'),
      version: 1,
    );
  }
}
