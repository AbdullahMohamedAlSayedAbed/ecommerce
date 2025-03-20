import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/in_active_and_active_shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    this.onTap,
  });
  final String title, subTitle, price;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side:
                isSelected
                    ? BorderSide(width: 1, color: AppColors.primaryColor)
                    : BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              InActiveAndActiveShippingItem(isSelected: isSelected),
              Column(
                spacing: 6,
                children: [
                  Text(title, style: TextStyles.semiBold13),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: Colors.black.withValues(alpha: 128),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: TextStyles.bold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
