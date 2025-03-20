import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

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
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        color: isAdd ? AppColors.primaryColor : const Color(0xFFF1F1F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Icon(
        !isAdd ? Icons.remove : Icons.add,
        color: isAdd ? Colors.white : Colors.grey,
        size: 18,
      ),
    );
  }
}

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartItemActionButton(isAdd: true, onTap: () {}),
        Text('3', textAlign: TextAlign.center, style: TextStyles.bold16),
        CartItemActionButton(isAdd: false, onTap: () {}),

      ],
    );
  }
}
