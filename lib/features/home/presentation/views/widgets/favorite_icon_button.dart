import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFav = state is FavoriteLoaded &&
            state.products.any((p) => p.code == product.code);

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: IconButton(
            key: ValueKey(isFav),
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              context.read<FavoriteCubit>().toggleFavorite(product);
            },
          ),
        );
      },
    );
  }
}

