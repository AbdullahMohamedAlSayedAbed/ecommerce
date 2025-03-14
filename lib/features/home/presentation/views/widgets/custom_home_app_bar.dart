import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'صباح الخير !...',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      leading: Image.asset(Assets.imagesProfileImage),
      trailing: NotificationWidget(),
      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
      ),
    );
  }
}
