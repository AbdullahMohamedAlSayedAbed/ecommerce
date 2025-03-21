import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: InkWell(
            onTap: () {
              checkValidationCheckoutSteps(index, context);
            },
            child: StepItem(
              text: getSteps()[index],
              index: index + 1,
              isActive: index <= currentIndex,
            ),
          ),
        );
      }),
    );
  }

  void checkValidationCheckoutSteps(int index, BuildContext context) {
    if (index != currentIndex) {
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
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
