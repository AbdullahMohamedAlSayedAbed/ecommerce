import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: productEntity,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<CartItemCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<CartCubit>(),
            ),
          ],
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
