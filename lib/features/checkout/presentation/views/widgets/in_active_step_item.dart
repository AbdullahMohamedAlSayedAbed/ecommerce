import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text(index.toString(), style: TextStyles.semiBold13),
        ),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
