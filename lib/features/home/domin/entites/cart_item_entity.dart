import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int count;
  CartItemEntity({required this.product, this.count = 0});
  num get calculateTotalPrice => product.price * count;
  num get calculateTotalCalories => product.numberOfCalories * count;
  num get calculateTotalWeight => product.unitAmount * count;
  num get increaseCount => count++;
  num get decreaseCount => count--;

  @override
  List<Object?> get props => [product];
}
