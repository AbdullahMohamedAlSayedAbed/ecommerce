import 'dart:developer';

import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({
    super.key,
    required this.pageController,
    required this.currentIndex,
  });
  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            currentIndex: currentIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          SafeArea(
            child: CustomButton(
              onPressed: () {
                if (currentIndex == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentIndex == 1) {
                  _handleAddressingValidation(context);
                }
              },
              text: getNextButtonText(currentIndex),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleAddressingValidation(BuildContext context) {
    if (context.read<OrderEntity>().formKey.currentState!.validate()) {
      context.read<OrderEntity>().formKey.currentState!.save();
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      context.read<OrderEntity>().autoValidateMode.value =
          AutovalidateMode.always;
    }
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showCustomToast(
        message: 'يرجي تحديد طريقه الدفع',
        type: ToastType.warning,
      );
    }
  }

  String getNextButtonText(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'تأكيد الطلب';
      default:
        return 'التالي';
    }
  }
}
