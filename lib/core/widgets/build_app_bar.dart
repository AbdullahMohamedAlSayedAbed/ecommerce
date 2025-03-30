import 'package:ecommerce/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar() {
  return AppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'الأكثر مبيعًا',
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
