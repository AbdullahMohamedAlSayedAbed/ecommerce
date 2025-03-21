import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
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
                pageController.animateToPage(
                  currentIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              text: getNextButtonText(currentIndex),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
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
