import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/build_app_bar.dart';
import 'package:ecommerce/features/best_selling_products/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider(
        create:
            (context) =>
                ProductsCubit(getIt.get<ProductsRepo>()),
        child: const BestSellingViewBody(),
      ),
    );
  }
}
