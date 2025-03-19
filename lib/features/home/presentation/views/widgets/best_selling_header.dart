import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.bestSelling);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
          ),
          Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
          ),
        ],
      ),
    );
  }
}
