import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.isAdd,
    required this.onTap,
  });
  final bool isAdd;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isAdd ? AppColors.primaryColor : const Color(0xFFF1F1F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Icon(
          !isAdd ? Icons.remove : Icons.add,
          color: isAdd ? Colors.white : Colors.grey,
          size: 18,
        ),
      ),
    );
  }
}

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartItemActionButton(
          isAdd: true,
          onTap: () {
            cartItemEntity.increaseCount;
            context.read<CartItemCubit>().changeQuantity(cartItemEntity);
          },
        ),
        Text(
          '${cartItemEntity.count}',
          textAlign: TextAlign.center,
          style: TextStyles.bold16,
        ),
        CartItemActionButton(
          isAdd: false,
          onTap: () {
            cartItemEntity.decreaseCount;
            if (cartItemEntity.count < 1) {
              context.read<CartCubit>().removeItemFromCart(cartItemEntity);
            } else {
              context.read<CartItemCubit>().changeQuantity(cartItemEntity);
            }
          },
        ),
      ],
    );
  }
}
