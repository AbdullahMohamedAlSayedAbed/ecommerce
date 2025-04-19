import 'package:ecommerce/features/checkout/data/models/order_product_model.dart';
import 'package:ecommerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:uuid/uuid.dart' show Uuid;

class OrderModel {
  final num totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel( {required this.orderId,
    required this.totalPrice,
    required this.uID,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      totalPrice: json['totalPrice'],
      uID: json['uID'],
      shippingAddress: ShippingAddressModel.fromJson(json['shippingAddress']),
      orderProducts:
          (json['orderProducts'] as List)
              .map((e) => OrderProductModel.fromJson(e))
              .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }
  factory OrderModel.fromEntity(OrderInputEntity order) {
    return OrderModel(
      orderId: Uuid().v4(),
      totalPrice: order.cartEntity.calculateTotalPriceCart,
      uID: order.uID,
      shippingAddress: ShippingAddressModel.fromEntity(order.shippingAddress!),
      orderProducts:
          order.cartEntity.cartItems
              .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
              .toList(),
      paymentMethod: order.payWithCash! ? 'Cash' : 'Paypal',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uID': uID,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddress.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
