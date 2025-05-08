import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: productEntity,
        child:  ProductDetailsViewBody(),
        ),
    );
  }
}
