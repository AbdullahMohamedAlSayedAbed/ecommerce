import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CartEntity cart = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity) {
    bool isExist = cart.isExist(productEntity);
    CartItemEntity cartItemEntity = cart.getCartItem(productEntity);
    if (isExist) {
      cartItemEntity.increaseCount;
    } else {
      cart.addProduct(cartItemEntity);
    }
    emit(CartItemAdded());
  }

  void removeItemFromCart(CartItemEntity cartItemEntity) {
    cart.removeItemFromCart(cartItemEntity);
    emit(CartItemRemoved());
  }
}
