import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_sliver_grid_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(slivers: [BestSellingSliverGridBlocBuilder()]),
    );
  }
}
