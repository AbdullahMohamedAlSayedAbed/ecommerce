import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/widgets/search_text_field.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_sliver_grid.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  CustomHomeAppBar(),
                  SizedBox(height: 16),
                  SearchTextField(),
                  SizedBox(height: 12),
                  FeaturedList(),
                  SizedBox(height: 12),
                  BestSellingHeader(),
                  SizedBox(height: 8),
                ],
              ),
            ),
            BestSellingSliverGrid(),
          ],
        ),
      ),
    );
  }
}
