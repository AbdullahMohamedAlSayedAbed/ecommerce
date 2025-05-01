import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final String _uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderBy, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
        if (query['where'] != null) {
          var where = query['where'];
          var whereValue = query['whereValue'];
          data = data.where(where, isEqualTo: whereValue);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> addDateInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    required Map<String, dynamic> data,
    String? primaryDocumentId,
    String? secondaryDocumentId,
  }) async {
    if (secondaryDocumentId != null) {
      await firestore
          .collection(primaryPath)
          .doc(primaryDocumentId)
          .collection(secondaryPath)
          .doc(secondaryDocumentId)
          .set(data);
    } else {
      await firestore
          .collection(primaryPath)
          .doc(primaryDocumentId)
          .collection(secondaryPath)
          .add(data);
    }
  }

  @override
  Future<dynamic> getDataInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    String? primaryDocumentId,
    String? secondaryDocumentId,
    Map<String, dynamic>? query,
  }) async {
    if (secondaryDocumentId != null) {
      var data =
          await firestore
              .collection(primaryPath)
              .doc(primaryDocumentId)
              .collection(secondaryPath)
              .doc(secondaryDocumentId)
              .get();
      if (!data.exists) {
        return null;
      }
      return data.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore
          .collection(primaryPath)
          .doc(primaryDocumentId)
          .collection(secondaryPath);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderBy, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
        if (query['where'] != null) {
          var where = query['where'];
          var whereValue = query['whereValue'];
          data = data.where(where, isEqualTo: whereValue);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> removeDateInsideCollection({
    required String primaryPath,
    required String secondaryPath,
    Map<String, dynamic>? data,
    String? primaryDocumentId,
    String? secondaryDocumentId,
  }) async {
    await firestore
        .collection(primaryPath)
        .doc(primaryDocumentId)
        .collection(secondaryPath)
        .doc(secondaryDocumentId)
        .delete();
  }
}
