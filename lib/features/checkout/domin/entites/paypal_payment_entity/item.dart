import 'package:ecommerce/core/helper/get_currency.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

factory Item.fromEntity(CartItemEntity cartEntity) {
    return Item(
      name: cartEntity.product.title,
      quantity: cartEntity.count,
      price: cartEntity.product.price.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
