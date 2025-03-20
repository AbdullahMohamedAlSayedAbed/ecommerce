import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});
  num get calculateTotalPriceCart => cartItems.fold(
    0,
    (previousValue, element) => previousValue + element.calculateTotalPrice,
  );
  bool isExist(ProductEntity product) {
    return cartItems.any((element) => element.product == product);
  }

  void addProduct(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void removeItemFromCart(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.product == product) {
        return cartItem;
      }
    }
    return CartItemEntity(product: product, count: 1);
  }
}
