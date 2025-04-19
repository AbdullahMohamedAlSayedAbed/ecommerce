import 'package:ecommerce/core/helper/get_currency.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  // factory Amount.fromJson(Map<String, dynamic> json) => Amount(
  //   total: json['total'] as String?,
  //   currency: json['currency'] as String?,
  //   details:
  //       json['details'] == null
  //           ? null
  //           : Details.fromJson(json['details'] as Map<String, dynamic>),
  // );
  factory Amount.fromEntity(OrderInputEntity order) {
    return Amount(
      total: order.calculateTotalPriceAfterDiscountAndShipping.toString(),
      currency: getCurrency(),
      details: Details.fromEntity(order),
    );
  }
  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
