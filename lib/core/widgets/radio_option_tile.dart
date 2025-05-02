import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

/// ويدجت عام يعرض RadioListTile بلا تكرار
class RadioOptionTile<T> extends StatelessWidget {
  final String title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  const RadioOptionTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: Text(title, textAlign: TextAlign.right, style: TextStyles.bold13),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
