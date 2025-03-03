import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String _uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<void> addDate({
    required String path,
    required Map<String, dynamic> data,
  }) async{
    await firestore.collection(path).add(data);
  }
}
