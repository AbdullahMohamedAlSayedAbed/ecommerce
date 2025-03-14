import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(icon, width: 20),
    );
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.icon, required this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: ShapeDecoration(
        color: Color(0xFFEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: Color(0xFF1B5E37),
              shape: OvalBorder(),
            ),
            child: Center(child: SvgPicture.asset(icon)),
          ),
          SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: TextStyles.semiBold11,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
