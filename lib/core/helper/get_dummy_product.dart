import 'package:ecommerce/core/entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    reviews: [],
    expirationsMonth: 6,
    numberOfCalories: 1,
    unitAmount: 1,
    title: "test",
    description: "test",
    sellingCount: 1,
    price: 1,
    code: "test",
    isFeatured: true,
    isOrganic: true,
  );
}
List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}