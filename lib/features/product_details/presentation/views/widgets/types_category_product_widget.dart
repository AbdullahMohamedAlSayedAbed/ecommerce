import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TypesCategoryProductWidget extends StatelessWidget {
  const TypesCategoryProductWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 8, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          SvgPicture.asset(image),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 4,
            children: [
              Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.right,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF969899),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
