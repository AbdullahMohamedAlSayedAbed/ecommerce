import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/models/productmodel.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    ProductEntity addProductInputEntity,
  ) async {
    try {
  var data =
      await databaseService.getData(path: BackendEndpoint.getProducts)
          as List<Map<String, dynamic>>;
  List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  return right(products);
}  catch (e) {
  log(e.toString(), name: "ProductRepoImpl.getProducts");
  return left(ServerFailure('حدث خطاء ما'));
}
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts(
    ProductEntity addProductInputEntity,
  ) async {
     try {
  var data =
      await databaseService.getData(path: BackendEndpoint.getProducts,query: {
        "limit": 10,
        "orderBy": "sellingCount",
        "descending": true,
      })
          as List<Map<String, dynamic>>;
  List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  return right(products);
}  catch (e) {
  log(e.toString(), name: "ProductRepoImpl.getProducts");
  return left(ServerFailure('حدث خطاء ما'));
}
  }
}
