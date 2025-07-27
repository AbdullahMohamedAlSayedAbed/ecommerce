import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      spacing: 16,
      children: [
        const SizedBox(height: 32),
        ShippingItem(
          onTap: () {
            setState(() {
              selected = 0;
              context.read<OrderInputEntity>().payWithCash = true;
            });
          },
          isSelected: selected == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price:
              (context
                          .read<OrderInputEntity>()
                          .cartEntity
                          .calculateTotalPriceCart +
                      30)
                  .toString(),
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selected = 1;
              context.read<OrderInputEntity>().payWithCash = false;
            });
          },
          isSelected: selected == 1,
          title: 'اشتري الان وادفع لاحقا',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price:
              context
                  .read<OrderInputEntity>()
                  .cartEntity
                  .calculateTotalPriceCart
                  .toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
  
}
