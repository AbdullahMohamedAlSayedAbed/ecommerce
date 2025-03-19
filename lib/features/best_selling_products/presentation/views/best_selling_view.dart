import 'package:ecommerce/core/widgets/build_app_bar.dart';
import 'package:ecommerce/features/best_selling_products/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:const BestSellingViewBody(),
    );
  }
}
