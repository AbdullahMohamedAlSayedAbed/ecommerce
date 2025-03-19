import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 91, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
      child: Text(
        'لديك 3 منتجات في سله التسوق',
        style: TextStyles.regular13.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
