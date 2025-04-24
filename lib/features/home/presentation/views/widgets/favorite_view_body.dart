import 'package:ecommerce/features/home/presentation/views/widgets/favorite_products_grid_view.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteProductsGridView(products: []);
  }
}
