import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleAndRattingWidget extends StatelessWidget {
  const TitleAndRattingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 23,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  Provider.of<ProductEntity>(context).title,
                  textAlign: TextAlign.right,
                  style: TextStyles.bold16,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '\$${Provider.of<ProductEntity>(context).price} جنية / ',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'كيلو',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
        Row(
          spacing: 9,
          children: [
            Icon(Icons.star, color: Colors.amberAccent, size: 18),
            Text(
              '${Provider.of<ProductEntity>(context).reviews?[0].ratting}',
              style: TextStyles.semiBold13,
            ),
            Text(
              '(${Provider.of<ProductEntity>(context).reviews?.length}+)',
              style: TextStyles.regular16.copyWith(
                color: const Color(0xFF9796A1),
              ),
            ),
            Text(
              'المراجعه',
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
