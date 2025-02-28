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
  ) async {
    try {
      var user = await authServices.signInWithCredentials(
        emailAddress: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        "signInWithCredentials = ${e.toString()}",
        name: "AuthRepoImpl.signInWithCredentials",
      );
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async{
    try {
      var user =await authServices.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user!));
    } catch (e) {
      log(
        "signInWithFacebook = ${e.toString()}",
        name: "AuthRepoImpl.signInWithFacebook",
      );
      return left(ServerFailure("حدث خطأ ما"));
      
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await authServices.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user!));
    } catch (e) {
      log(
        "signInWithGoogle = ${e.toString()}",
        name: "AuthRepoImpl.signInWithGoogle",
      );
      return left(ServerFailure("حدث خطأ ما"));
    }
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
