import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/error/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();


}
