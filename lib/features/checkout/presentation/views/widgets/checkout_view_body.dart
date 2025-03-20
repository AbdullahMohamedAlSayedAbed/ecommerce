import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(children: [SizedBox(height: 20), CheckoutSteps()]),
    );
  }
}
