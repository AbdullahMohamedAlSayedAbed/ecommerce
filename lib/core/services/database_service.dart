
abstract class DatabaseService {
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<void> addDateInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    required Map<String, dynamic> data,
    String? primaryDocumentId,
    String? secondaryDocumentId,
  });
  Future<dynamic> getData({
    required String path,
    String documentId,
    Map<String, dynamic>? query,
  });
  Future<dynamic> getDataInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    String? primaryDocumentId,
    String? secondaryDocumentId,
    Map<String, dynamic>? query,
  });
  Future<void> removeDateInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    String? primaryDocumentId,
    String? secondaryDocumentId,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
}
