import 'package:sqflite/sqflite.dart';
import 'package:widgets_responsive/local_database/db_helper.dart';
import 'package:widgets_responsive/local_database/db_method.dart'; // Corrected the import
import 'package:widgets_responsive/local_database/loclal_data.dart';
import 'package:widgets_responsive/local_database/string_constant.dart';

class UserDbMethods implements DbMethods<UserModel> {
  late final Database _db;

  UserDbMethods._privateConstructor();

  static Future<UserDbMethods> create() async {
    final instance = UserDbMethods._privateConstructor();
    await instance._initializeDb();
    return instance;
  }

  Future<void> _initializeDb() async {
    _db = await DbHelper().database; // Await the database access
  }

  @override
  Future<void> insertData(UserModel user) async {
    await _db.insert(
      TextConstants.userTable,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      nullColumnHack: "",
    );
  }

  @override
  Future<List<UserModel>> fetchData(String forTable) async {
    final List<Map<String, dynamic>> maps = await _db.query(forTable);
    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> deleteData(UserModel user) async {
    await _db.delete(
      TextConstants.userTable,
      where: '${TextConstants.userId} = ?',
      whereArgs: [user.id],
    );
  }

  @override
  Future<void> createTable(Map<String, String> columns) async {
    final columnDefinitions = columns.entries.map((entry) {
      return '${entry.key} ${entry.value}';
    }).join(', ');

    await _db.execute(
      'CREATE TABLE IF NOT EXISTS ${TextConstants.userTable} ($columnDefinitions)',
    );
  }
}
