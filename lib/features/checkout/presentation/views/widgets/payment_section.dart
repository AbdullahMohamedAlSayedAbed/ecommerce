import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart' show OrderEntity;
import 'package:ecommerce/features/checkout/presentation/views/widgets/order_summary_payment_widget.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        OrderSummaryPaymentWidget(),
        const SizedBox(height: 16),
        PaymentItem(
          title: 'عنوان التوصيل',
          child: Column(
            spacing: 9,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      const Icon(Icons.location_on_outlined, size: 24),
                      Text(
                        context.read<OrderEntity>().shippingAddress.toString(),
                        style: TextStyles.bold13,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      const Icon(Icons.edit, size: 16),
                      Text('تعديل', style: TextStyles.bold13),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
