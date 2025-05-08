import 'package:ecommerce/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/favorite_products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).getFavorites();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          return FavoriteProductsGridView(products: state.products);
        } else if (state is FavoriteError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
