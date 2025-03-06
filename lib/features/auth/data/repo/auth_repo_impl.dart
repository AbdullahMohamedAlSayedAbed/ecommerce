import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/excaption.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';
import 'package:ecommerce/features/auth/data/model/user_model.dart';
import 'package:ecommerce/features/auth/domin/entites/user_entity.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthServices authServices;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.authServices});
  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var user = await databaseService.getData(
      path: BackendEndpoint.getUsersData,
      documentId: uid,
    );
    return UserModel.fromJson(user);
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
      var userEntity =await getUserData(uid: user!.uid);
      return right(userEntity);
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
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await authServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user!);
      await addUserData(user: userEntity, uid: user.uid);
      return right(userEntity);
    } catch (e) {
      await checkDeleteUser(user);
      log(
        "signInWithFacebook = ${e.toString()}",
        name: "AuthRepoImpl.signInWithFacebook",
      );
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await authServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user!);
      await addUserData(user: userEntity, uid: user.uid);
      return right(userEntity);
    } catch (e) {
      await checkDeleteUser(user);
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
    User? user;
    try {
      user = await authServices.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      var userEntity = UserModel.fromFirebaseUser(user, name: name);
      await addUserData(user: userEntity, uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      await checkDeleteUser(user);
      return left(ServerFailure(e.message.toString()));
    } catch (e) {
      await checkDeleteUser(user);
      log("signUp = ${e.toString()}", name: "AuthRepoImpl.signUp");
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  Future<void> checkDeleteUser(User? user) async {
    if (user != null) {
      await authServices.deleteUser();
    }
  }

  @override
  Future addUserData({required UserEntity user, required String uid}) async {
    await databaseService.addDate(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: uid,
    );
  }
}
