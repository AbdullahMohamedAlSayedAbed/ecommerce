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
    // 1. لو في لودينج، ما تعملش حاجة
    if (state is FavoriteLoading) {
      return;
    }

    // 2. لو الستيت مش FavoriteLoaded، حمّل المفضلات الأول
    if (state is! FavoriteLoaded) {
      await getFavorites();
      if (state is! FavoriteLoaded) {
        emit(FavoriteError('فشل تحميل المفضلات'));
        return;
      }
    }

    // 3. جيب اللست الحالية
    final currentFavorites = (state as FavoriteLoaded).products;
    final isFav = currentFavorites.any((p) => p.code == product.code);

    // 4. نشّط اللودينج
    emit(FavoriteLoading());

    // 5. نفّذ العملية (إضافة أو حذف)
    final result = isFav
        ? await favoritesRepository.removeFavorite(product.code)
        : await favoritesRepository.addFavorite(product);

    result.fold(
      (failure) {
        emit(FavoriteError(failure.message));
        // اختياري: اعادة تحميل المفضلات لو حبيت
        // await getFavorites();
      },
      (_) {
        // 6. حدّث اللست محلياً
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