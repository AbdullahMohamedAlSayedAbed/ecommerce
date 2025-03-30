import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(
      items: items.map((e) => Item.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
