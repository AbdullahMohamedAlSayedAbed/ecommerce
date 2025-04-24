import 'dart:developer';

import 'package:ecommerce/core/error/excaption.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
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
  Future<User?> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(
          loginResult.accessToken?.tokenString ?? '',
        );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  @override
  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  @override
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }

  @override
  bool isSignIn() {
    return _firebaseAuth.currentUser != null;
  }
  
  @override
bool emailVerified() {
  final user = _firebaseAuth.currentUser;
  if (user != null) {
    return user.emailVerified;
  }
  return false;
}
  
  @override
Future<void> sendEmailVerification() {
  final user = _firebaseAuth.currentUser;
  if (user != null) {
    return user.sendEmailVerification();
  }
  return Future.error("No user logged in");
}
}
