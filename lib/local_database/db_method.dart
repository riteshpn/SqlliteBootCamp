abstract class DbMethods<T> {
  Future<void> insertData(T data);
  Future<List<T>> fetchData(String forTable);
  Future<void> deleteData(T data);
  Future<void> createTable(Map<String, String> columns);
}
