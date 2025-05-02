import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/enum/sort_option.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  List<ProductEntity> _allProducts = [];
  int productLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (errMessage) => emit(ProductsFailure(errMessage: errMessage.message)),
      (products) {
        _allProducts = products;
        emit(ProductsSuccess(products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (errMessage) => emit(ProductsFailure(errMessage: errMessage.message)),
      (products) {
        productLength = products.length;
        _allProducts = products;
        emit(ProductsSuccess(products));
      },
    );
  }

  void searchProducts(String query)  {
    if (query.isEmpty) {
      // لو المسطرة فاضية، رجع اللست الأصلية
      emit(ProductsSuccess(_allProducts));
    } else {
      // فلترة محلية على الاسم أو الوصف
      final filtered =
          _allProducts.where((p) {
            final lower = query.toLowerCase();
            return p.title.toLowerCase().contains(lower) ||
                p.description.toLowerCase().contains(lower);
          }).toList();
          log('عدد المنتجات المفلترة: ${filtered.length} = $filtered');
      productLength = filtered.length;
      emit(ProductsSuccess(filtered));
    }
  }
  void sortBy(SortOption option) {
    // ننسخ القائمة الأصلية حتى لا نغيّرها
    final sorted = List<ProductEntity>.from(_allProducts);
    switch (option) {
      case SortOption.priceAsc:
        sorted.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceDesc:
        sorted.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.alphabetical:
        sorted.sort(
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        );
        break;
    }
    productLength = sorted.length;
    emit(ProductsSuccess(sorted));
  }
}
