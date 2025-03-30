import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      name: cartItemEntity.product.title,
      code: cartItemEntity.product.code,
      imageUrl: cartItemEntity.product.imageUrl!,
      price: cartItemEntity.product.price,
      quantity: cartItemEntity.count,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
