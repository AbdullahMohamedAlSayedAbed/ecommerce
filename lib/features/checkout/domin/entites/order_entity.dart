import 'package:ecommerce/features/checkout/domin/entites/shipping_address_entity.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
   bool? payWithCash;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
     this.payWithCash,
     this.shippingAddress,
  });
}
