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
      } else if (e.code == 'invalid-email') {
        throw CustomException("البريد الالكتروني غير صالح");
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException("العملية غير مسموحة");
      } else if (e.code == 'network-request-failed') {
        throw CustomException("حدث خطأ في الشبكة");
      }
            throw CustomException("حدث خطأ ما");

    } catch (e) {
      log(
        e.toString(),
        name: "FirebaseAuthService.createUserWithEmailAndPassword",
      );
      throw CustomException("حدث خطأ ما");
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
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

  @override
  Future<User?> signInWithCredentials({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("${e.toString()}=={${e.code}}");
      if (e.code == 'user-not-found' || e.code == 'wrong-password'|| e.code == 'invalid-credential') {
        throw CustomException("البريد الالكتروني او كلمة المرور غير صحيحة");
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException("العملية غير مسموحة");
      } else if (e.code == 'network-request-failed') {
        throw CustomException("حدث خطأ في الشبكة");
      }
      throw CustomException("حدث خطأ ما");
    } catch (e) {
      log(e.toString(), name: "FirebaseAuthService.signInWithCredentials");
      throw CustomException("حدث خطأ ما");
    }
  }

  @override
  Future<User?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
