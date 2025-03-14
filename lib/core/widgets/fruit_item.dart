import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(Assets.imagesWatermelon),
                  SizedBox(height: 24),
                ListTile(
                  title: Text(
                    'فراولة',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold13.copyWith(
                      color: Color(0xFF0C0D0D),
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30جنية / ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
