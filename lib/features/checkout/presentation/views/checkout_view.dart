import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الشحن', showNotification: false),
      body: CheckoutViewBody(),
    );
  }
}
