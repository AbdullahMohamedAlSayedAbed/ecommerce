import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeatureItemButton extends StatelessWidget {
  const FeatureItemButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyles.bold16.copyWith(color: Color(0xFF1B5E37)),
          ),
        ),
      ),
    );
  }
}
