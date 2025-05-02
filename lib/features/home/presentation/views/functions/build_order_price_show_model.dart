  import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/price_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void buildOrderPriceShowModal(BuildContext context) {
    final productsCubit = context.read<ProductsCubit>();
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
    
      context: context,
      builder:
          (context) => BlocProvider.value(
            value: productsCubit,
            child: PriceOrderWidget(),
          ),
    );
  }