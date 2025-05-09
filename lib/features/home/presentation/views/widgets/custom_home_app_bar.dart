import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_network_image.dart';
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
      leading:getUser().imageUrl != null ? SizedBox(
        height: 60,
        width: 60,
        child: ClipOval(child: CustomNetworkImage(imageUrl: getUser().imageUrl!))) : Image.asset(Assets.imagesProfileImage),
      trailing: NotificationWidget(),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        maxLines: 1,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
      ),
    );
  }
}
