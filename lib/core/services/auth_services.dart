import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<void> signOut();

  Future<User?> signInAnonymously();

  Future<User?> signInWithGoogle();
  Future<void> deleteUser();
  Future<User?> signInWithFacebook();

  Future<User?> signInWithCredentials({
    required String emailAddress,
    required String password,
  });
  bool isSignIn();
  bool emailVerified();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordResetEmail({
    required String emailAddress,
  });
  Future<void> updatePassword({
    required String password,
  });
}
