import 'dart:io';

import 'package:ecommerce/core/entites/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
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
  final num sellingCount;
  num avgRating = 0, ratingCount = 0;
  final List<ReviewEntity>? reviews;
  ProductEntity({
    this.reviews,
    required this.expirationsMonth,
    this.isOrganic = false,
    this.sellingCount = 0,
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

  @override
  List<Object?> get props => [code];
}
