import 'package:sqflite/sqlite_api.dart';
import 'package:widgets_responsive/local_database/db_helper.dart';
import 'package:widgets_responsive/local_database/db_method.dart';
import 'package:widgets_responsive/local_database/product_local/product_model.dart';
import 'package:widgets_responsive/local_database/product_local/string_product_constant.dart';

class DbProduct implements DbMethods<ProductModel> {
  late final Database _db;
  DbProduct._privateConstructor();

  static Future<DbProduct> create() async {
    final instance = DbProduct._privateConstructor();
    await instance._initializeDb();
    return instance;
  }

  Future<void> _initializeDb() async {
    _db = await DbHelper().database;
  }

  @override
  Future<void> insertData(ProductModel product) async {
    await _db.insert(
      TextConstantsProduct.productName,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      nullColumnHack: "",
    );
  }

  @override
  Future<List<ProductModel>> fetchData(String forTable) async {
    final List<Map<String, dynamic>> maps = await _db.query(forTable);
    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }

  @override
  Future<void> deleteData(ProductModel product) async {
    await _db.delete(
      TextConstantsProduct.productTable,
      where: '${TextConstantsProduct.productId} = ?',
      whereArgs: [product.id],
    );
  }

  @override
  Future<void> createTable(Map<String, String> columns) async {
    final columnDefinitions = columns.entries.map((entry) {
      return '${entry.key} ${entry.value}';
    }).join(', ');

    await _db.execute(
      'CREATE TABLE IF NOT EXISTS ${TextConstantsProduct.productTable} ($columnDefinitions)',
    );
  }

  @override
  Future<void> update(ProductModel product) async {
    Map<String, dynamic> updatedValues = product.toMap();
    updatedValues.remove(TextConstantsProduct.productId);
    await _db.update(
      TextConstantsProduct.productTable,
      updatedValues,
      where: '${TextConstantsProduct.productId} = ?',
      whereArgs: [product.id],
    );
  }
}
