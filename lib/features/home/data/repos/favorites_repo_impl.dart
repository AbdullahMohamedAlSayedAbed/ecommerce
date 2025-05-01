import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/models/product_model.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';
import 'package:ecommerce/features/home/domin/repos/favorites_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesRepoImpl implements FavoritesRepository {
  final DatabaseService databaseService;
  FavoritesRepoImpl({required this.databaseService});
    String get _userId {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('User not authenticated');
    }
    return uid;
  }
  @override
  Future<Either<Failure, void>> addFavorite( ProductEntity product) async {
    try {
      await databaseService.addDateInsideCollection(
        primaryPath: BackendEndpoint.addUserData,
        secondaryPath: BackendEndpoint.favorites,
        data: ProductModel.fromEntity(product).toJson(),
        primaryDocumentId: _userId,
        secondaryDocumentId: product.code,
      );
      return const Right(null);
    } catch (e) {
      log(e.toString(), name: "FavoritesRepoImpl.addFavorite");
      return Left(ServerFailure('حدث خطاء ما'));
    }
    
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async{
    try {
      var data = await databaseService.getDataInsideCollection(
        primaryPath: BackendEndpoint.addUserData,
        secondaryPath: BackendEndpoint.favorites,
        primaryDocumentId: _userId,
      ) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      log(e.toString(), name: "ProductRepoImpl.getProducts");
      return left(ServerFailure('حدث خطاء ما'));
    }
  }

  @override
  Future<Either<Failure,void>> removeFavorite( String productId) async {
    try {
      await databaseService.removeDateInsideCollection(
        primaryPath: BackendEndpoint.addUserData,
        secondaryPath: BackendEndpoint.favorites,
        primaryDocumentId: _userId,
        secondaryDocumentId: productId,
      );
      return const Right(null);
    } catch (e) {
      log(e.toString(), name: "FavoritesRepoImpl.removeFavorite");
      return Left(ServerFailure('حدث خطاء ما'));
    }
    
  }
  
}