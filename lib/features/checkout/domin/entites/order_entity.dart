import 'package:ecommerce/features/checkout/domin/entites/shipping_address_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:flutter/material.dart';

class OrderInputEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress = ShippingAddressEntity();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> autoValidateMode =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  OrderInputEntity({
    required this.uID,
    required this.cartEntity,
    this.payWithCash,
  });

  double get calculateShippingCost {
    if (!payWithCash!) {
      return 0;
    } else {
      return 30;
    }
  }

  double get calculateShippingDiscount {
    return 0;
  }

  double get calculateTotalPriceAfterDiscountAndShipping {
    return cartEntity.calculateTotalPriceCart +
        calculateShippingCost -
        calculateShippingDiscount;
  }
}
