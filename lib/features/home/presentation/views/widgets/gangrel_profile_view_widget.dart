import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class GangrelProfileViewWidget extends StatelessWidget {
  const GangrelProfileViewWidget({super.key, required this.name, this.onTap, required this.icon});
  final String name;
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            Icon(icon, color: AppColors.primaryColor),
            Text(
              name,
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
