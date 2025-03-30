import 'package:ecommerce/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getPages.length,
      itemBuilder: (context, index) => getPages[index],
    );
  }

  List<Widget> get getPages {
    return [ShippingSection(), AddressInputSection(), PaymentSection(
      pageController: pageController,
    )];
  }
}
