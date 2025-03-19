import 'dart:io';

import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/models/review_model.dart';


class ProductModel {
  final String title;
  final String description;
  final File image;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating, ratingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    this.ratingCount = 0,
    this.avgRating = 0,
    required this.expirationsMonth,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
  factory ProductModel.fromEntity(
    ProductEntity addProductInputEntity,
  ) {
    return ProductModel(
      reviews:
          addProductInputEntity.reviews
              .map((e) => ReviewModel.fromEntity(e))
              .toList(),
      expirationsMonth: addProductInputEntity.expirationsMonth,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      title: addProductInputEntity.title,
      description: addProductInputEntity.description,
      image: addProductInputEntity.image,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      avgRating: addProductInputEntity.avgRating,
      ratingCount: addProductInputEntity.ratingCount,
      isOrganic: addProductInputEntity.isOrganic,
    );
  }
  toJson() {
    return {
      'name': title,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
