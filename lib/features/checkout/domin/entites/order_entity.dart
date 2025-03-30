import 'package:ecommerce/features/checkout/domin/entites/shipping_address_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:flutter/material.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddress = ShippingAddressEntity();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> autoValidateMode =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  OrderEntity( {required this.uID,required this.cartEntity, this.payWithCash});
}
