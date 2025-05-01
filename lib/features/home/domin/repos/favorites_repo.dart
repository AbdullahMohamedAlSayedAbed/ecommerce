import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/error/failures.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, void>> addFavorite(
    ProductEntity product,
  );
  Future<Either<Failure, void>> removeFavorite(
    String productId,
  );
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
}
