import 'dart:io';

import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/models/review_model.dart';

class ProductModel {
  final String title;
  final String description;
  final File? image;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final int sellingCount;
  final num? avgRating, ratingCount;
  final List<ReviewModel>? reviews;

  ProductModel({
    required this.reviews,
    this.ratingCount = 0,
    this.avgRating = 0,
    this.sellingCount = 0,
    required this.expirationsMonth,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.title,
    required this.description,
    this.image,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      reviews:
          addProductInputEntity.reviews
              ?.map((e) => ReviewModel.fromEntity(e))
              .toList(),
      expirationsMonth: addProductInputEntity.expirationsMonth,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      title: addProductInputEntity.title,
      description: addProductInputEntity.description,
      image: addProductInputEntity.image,
      sellingCount: addProductInputEntity.sellingCount,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      avgRating: addProductInputEntity.avgRating,
      ratingCount: addProductInputEntity.ratingCount,
      isOrganic: addProductInputEntity.isOrganic,
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      reviews: reviews?.map((e) => e.toEntity()).toList(),
      expirationsMonth: expirationsMonth,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      title: title,
      description: description,
      image: image,
      sellingCount: sellingCount,
      price: price,
      code: code,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      isOrganic: isOrganic,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      reviews:
          json['reviews'] == null
              ? []
              : (json['reviews'] as List)
                  .map((e) => ReviewModel.fromJson(e))
                  .toList(),
      expirationsMonth: json['expirationsMonth'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      title: json['name'],
      description: json['description'],
      image: json['image'],
      sellingCount: json['sellingCount'],
      price: json['price'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      isOrganic: json['isOrganic'],
    );
  }
  toJson() {
    return {
      'name': title,
      'description': description,
      'price': price,
      'code': code,
      'sellingCount': sellingCount,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
    };
  }
}
