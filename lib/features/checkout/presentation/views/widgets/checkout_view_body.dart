import 'dart:developer';

import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/utils/app_keys.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:ecommerce/features/checkout/domin/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:ecommerce/features/checkout/presentation/cubits/cubit/add_order_cubit.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
            onStepTapped: (index) {
              if (index == 0) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              } else if (index == 1) {
                if (context.read<OrderInputEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                } else {
                  showCustomToast(
                    message: 'يرجي تحديد طريقه الدفع',
                    type: ToastType.warning,
                  );
                }
              } else {
                _handleAddressingValidation(context);
              }
            },
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
                } else {
                  _processPayment(context);
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
    if (context.read<OrderInputEntity>().formKey.currentState!.validate()) {
      context.read<OrderInputEntity>().formKey.currentState!.save();
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      context.read<OrderInputEntity>().autoValidateMode.value =
          AutovalidateMode.always;
    }
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
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

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: AppKeys.clientID,
              secretKey: AppKeys.clientSecret,
              transactions: [paypalPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) {
                log("onSuccess: $params");
                Navigator.pop(context);
                addOrderCubit.addOrder(order: orderEntity);
                showCustomToast(
                  message: 'تم الدفع بنجاح',
                  type: ToastType.success,
                );
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
                showCustomToast(message: 'حدث خطاء', type: ToastType.error);
              },
              onCancel: () {
                log('cancelled:');
              },
            ),
      ),
    );
  }
}
