import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/helper/get_avg_rating.dart';

import 'review_model.dart';
class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.avgRating,
    required this.unitAmount,
    required this.sellingCount,
    required this.reviews,
    required this.price,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
  }) : ratingCount = reviews.length;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsList = (json['reviews'] as List<dynamic>?)
            ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
            .toList() ?? [];

    return ProductModel(
      avgRating: getAvgRating(reviewsList),
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      expirationsMonths: (json['expirationsMonths'] as int?) ?? 0,
      numberOfCalories: (json['numberOfCalories'] as int?) ?? 0,
      unitAmount: (json['unitAmount'] as int?) ?? 0,
      sellingCount: (json['sellingCount'] as num?) ?? 0,
      reviews: reviewsList,
      price: (json['price'] as num?) ?? 0,
      isOrganic: (json['isOrganic'] as bool?) ?? false,
      isFeatured: (json['isFeatured'] as bool?) ?? false,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    final reviewsList = entity.reviews
            ?.map((e) => ReviewModel.fromEntity(e))
            .toList() ?? [];

    return ProductModel(
      avgRating: getAvgRating(reviewsList),
      name: entity.title,
      code: entity.code,
      description: entity.description,
      expirationsMonths: entity.expirationsMonth,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      sellingCount: 0,
      reviews: reviewsList,
      price: entity.price,
      isOrganic: entity.isOrganic,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      title: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonth: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
