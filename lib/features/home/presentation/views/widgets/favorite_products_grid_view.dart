import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class FavoriteProductsGridView extends StatelessWidget {
  const FavoriteProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
