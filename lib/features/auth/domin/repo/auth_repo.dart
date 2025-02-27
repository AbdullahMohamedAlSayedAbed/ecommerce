import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';

abstract class AuthRepo {
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithCredentials(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signUp({
  required  String email,
 required   String password,
  required  String name,
  });
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}
