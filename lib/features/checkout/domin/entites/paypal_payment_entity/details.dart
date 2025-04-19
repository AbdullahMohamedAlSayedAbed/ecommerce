import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  // factory Details.fromJson(Map<String, dynamic> json) => Details(
  //   subtotal: json['subtotal'] as String?,
  //   shipping: json['shipping'] as String?,
  //   shippingDiscount: json['shipping_discount'] as int?,
  // );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory Details.fromEntity(OrderInputEntity order) {
    return Details(
      subtotal: order.cartEntity.calculateTotalPriceCart.toString(),
      shipping: order.calculateShippingCost.toString(),
      shippingDiscount: order.calculateShippingDiscount,
    );
  }
}
