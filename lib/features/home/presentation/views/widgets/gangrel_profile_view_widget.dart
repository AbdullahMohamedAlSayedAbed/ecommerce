import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class GangrelProfileViewWidget extends StatelessWidget {
  const GangrelProfileViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.favorite);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFFF2F3F3) /* Grayscale-50 */,
            ),
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            Icon(Icons.favorite_outline, color: AppColors.primaryColor),
            Text(
              'المفضلة',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF949D9E),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
