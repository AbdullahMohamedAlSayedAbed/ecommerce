import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final String _uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var userRef = await firestore.collection(path).doc(documentId).get();
    return userRef.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
