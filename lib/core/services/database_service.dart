abstract class DatabaseService {
  // service in general

  Future<void> addData(
      // path == collection Name
      {required String path,
      required Map<String, dynamic> data,
      String? id});

  Future<Map<String, dynamic>> getData(
      {required String path, required String id});

  Future<bool> isUserExist({required String path, required String id});
}
