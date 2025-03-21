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
    var orderEntity = context.watch<OrderEntity>();
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
                if (orderEntity.payWithCash != null) {
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
