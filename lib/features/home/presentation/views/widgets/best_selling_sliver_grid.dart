import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSellingSliverGrid extends StatelessWidget {
  const BestSellingSliverGrid({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => FruitItem(product: products[index]),
      itemCount: products.length,
    );
  }
}
