import 'package:ecommerce/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;
  CartItemEntity({required this.product, this.count = 0});
  num get calculateTotalPrice => product.price * count;
  num get calculateTotalCalories => product.numberOfCalories * count;
  num get calculateTotalWeight => product.unitAmount * count;
  num get increaseCount => count++;
  num get decreaseCount => count--;
}
