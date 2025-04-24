import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileDate extends StatelessWidget {
  const ProfileDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Image.asset(Assets.imagesProfileImage),
        Text(
          getUser().name,
          style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        Text(
          getUser().email,
          style: TextStyles.regular16.copyWith(color: const Color(0xFF888FA0)),
        ),
      ],
    );
  }
}
