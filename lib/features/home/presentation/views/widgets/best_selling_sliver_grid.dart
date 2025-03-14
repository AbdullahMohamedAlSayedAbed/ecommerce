import 'package:ecommerce/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class BestSellingSliverGrid extends StatelessWidget {
  const BestSellingSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => const FruitItem(),
      itemCount: 6,
    );
  }
}
