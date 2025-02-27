import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/excaption.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/features/auth/data/model/user_model.dart';
import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthServices authServices;

  AuthRepoImpl({required this.authServices});
  @override
  Future<String> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithCredentials(
    String email,
    String password,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await authServices.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message.toString()));
    } catch (e) {
      log("signUp = ${e.toString()}", name: "AuthRepoImpl.signUp");
      return left(ServerFailure("حدث خطأ ما"));
    }
  }
}
