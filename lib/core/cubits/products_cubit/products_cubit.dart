import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productLength = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (errMessage) => emit(ProductsFailure(errMessage: errMessage.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (errMessage) => emit(ProductsFailure(errMessage: errMessage.message)),
      (products) {
        productLength = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }
}
