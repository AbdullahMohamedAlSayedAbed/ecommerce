import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder:
          (context, index) => CartItem(cartItemEntity: cartItems[index]),
      itemCount: cartItems.length,
    );
  }
}
