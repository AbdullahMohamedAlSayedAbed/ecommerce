abstract class DatabaseService {
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
  });
}
