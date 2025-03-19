import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/helper/get_dummy_product.dart';
import 'package:ecommerce/core/widgets/custom_error_widget.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingSliverGridBlocBuilder extends StatelessWidget {
  const BestSellingSliverGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingSliverGrid(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child:  BestSellingSliverGrid(
              products:getDummyProducts() ,
            ));
        }
      },
    );
  }
}
