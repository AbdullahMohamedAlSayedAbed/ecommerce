
abstract class DatabaseService {
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  });
  Future<Map<String,dynamic>> getData({required String path, required String documentId});
  Future<bool> checkIfDataExists({required String path, required String documentId});
}
