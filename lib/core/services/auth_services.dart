import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<void> signOut();

  Future<User?> signInAnonymously();

  Future<User?> signInWithGoogle();

  Future<User?> signInWithFacebook();

  Future<User?> signInWithCredentials({
    required String emailAddress,
    required String password,
  });
}
