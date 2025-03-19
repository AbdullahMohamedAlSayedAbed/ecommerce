import 'package:ecommerce/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(

      itemBuilder: (context, index) => CartItem(),
      itemCount: 8,
    );
  }
}
