import 'package:ecommerce/core/utils/app_decorations.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItem(
          title: 'ملخص الطلب :',
          child: Column(
            spacing: 9,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المجموع الفرعي :', style: TextStyles.bold13),
                  Text('200 جنية', style: TextStyles.bold13),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Text('التوصيل  :', style: TextStyles.semiBold13.copyWith(color: const Color(0xFF4E5556))),
               Text('30 جنية', style: TextStyles.semiBold13.copyWith(color: const Color(0xFF4E5556))),
            ]),
            ],
          ),
        ),
        PaymentItem(title: 'يرجي تأكيد  طلبك'),
      ],
    );
  }
}
