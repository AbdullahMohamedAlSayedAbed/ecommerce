import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cart.calculateTotalPriceCart > 0) {
              Navigator.pushNamed(context, AppRouter.checkout);
            } else {
              showCustomToast(
                message: 'لا يوجد منتجات',
                type: ToastType.warning,
              );
            }
          },
          text:
              'الدفع  ${context.watch<CartCubit>().cart.calculateTotalPriceCart} جنيه',
        );
      },
    );
  }
}
