import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  
  factory PaypalPaymentEntity.fromEntity(OrderEntity order) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(order),
      description: 'Payment for order ${order.uID}',
      itemList: ItemList.fromEntity(items: order.cartEntity.cartItems),
    );
  }


  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
