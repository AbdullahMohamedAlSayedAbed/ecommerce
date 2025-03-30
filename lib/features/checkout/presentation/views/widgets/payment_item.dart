import 'package:ecommerce/core/utils/app_decorations.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, this.child});
  final String title;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(title, style: TextStyles.bold13),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
