import 'package:ecommerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/in_active_step_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text;
  final int index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(text: text),
      secondChild: InActiveStepItem(text: text, index: index),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
    );
  }
}
