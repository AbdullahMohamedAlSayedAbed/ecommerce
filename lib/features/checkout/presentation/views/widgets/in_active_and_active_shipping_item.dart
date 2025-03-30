import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InActiveAndActiveShippingItem extends StatelessWidget {
  const InActiveAndActiveShippingItem({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        shape: OvalBorder(
          side:
              isSelected
                  ? BorderSide(width: 4, color: Colors.white)
                  : BorderSide(width: 1, color: const Color(0xFF949D9E)),
        ),
      ),
    );
  }
}
