import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        child: ProductsViewBody(),
      ),
    );
  }
}
