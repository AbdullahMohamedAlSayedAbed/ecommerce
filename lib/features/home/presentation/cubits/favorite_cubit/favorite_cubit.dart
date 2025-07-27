import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/features/home/domin/repos/favorites_repo.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepository favoritesRepository;

  FavoriteCubit(this.favoritesRepository) : super(FavoriteInitial());

  /// Load all favorite products
  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    final result = await favoritesRepository.getFavorites();
    result.fold(
      (failure) => emit(FavoriteError(failure.message)),
      (products) => emit(FavoriteLoaded(products)),
    );
  }

  Future<void> toggleFavorite(ProductEntity product) async {
    if (state is FavoriteLoading) {
      return;
    }

    if (state is! FavoriteLoaded) {
      await getFavorites();
      if (state is! FavoriteLoaded) {
        emit(FavoriteError('فشل تحميل المفضلات'));
        return;
      }
    }

    final currentFavorites = (state as FavoriteLoaded).products;
    final isFav = currentFavorites.any((p) => p.code == product.code);

    emit(FavoriteLoading());

    final result = isFav
        ? await favoritesRepository.removeFavorite(product.code)
        : await favoritesRepository.addFavorite(product);

    result.fold(
      (failure) {
        emit(FavoriteError(failure.message));
      },
      (_) {
        List<ProductEntity> updated;
        if (isFav) {
          updated = List<ProductEntity>.from(currentFavorites)
            ..removeWhere((p) => p.code == product.code);
        } else {
          updated = List<ProductEntity>.from(currentFavorites)..add(product);
        }
        emit(FavoriteLoaded(updated));
      },
    );
  }
}