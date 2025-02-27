import 'dart:developer';

import 'package:ecommerce/core/error/excaption.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService extends AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("${e.toString()}=={${e.code}}");
      if (e.code == 'weak-password') {
        throw CustomException("كلمة المرور ضعيفة");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException("البريد الالكتروني مستخدم بالفعل");
      }
    } catch (e) {
      log(e.toString());
      throw CustomException("حدث خطأ ما");
    }
    throw CustomException("حدث خطأ ما");
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> signInAnonymously() async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
