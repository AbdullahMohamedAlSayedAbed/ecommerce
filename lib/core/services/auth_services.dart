import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,

  });
}
