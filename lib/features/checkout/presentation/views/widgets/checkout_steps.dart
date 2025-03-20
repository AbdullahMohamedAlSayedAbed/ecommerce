import 'package:ecommerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            text: getSteps()[index],
            index: index + 1,
            isActive: false,
          ),
        );
      }),
    );
  }

}
  List<String>  getSteps() {
    return ['الشحن', 'العنوان', 'الدفع'];
  }
