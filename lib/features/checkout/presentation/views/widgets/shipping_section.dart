import 'package:ecommerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const SizedBox(height: 32),
        ShippingItem(
          onTap: () {
            setState(() {
              selected = 0;
            });
          },
          isSelected: selected == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selected = 1;
            });
          },
          isSelected: selected == 1,
          title: 'اشتري الان وادفع لاحقا',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
        ),
      ],
    );
  }
}
