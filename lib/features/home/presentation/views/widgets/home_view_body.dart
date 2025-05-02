import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/widgets/search_text_field.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_sliver_grid_bloc_builder.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
    void _onSearch(String query) {
    if (query.isEmpty) {
      // إذا كان الاستعلام فارغًا، نعيد جلب المنتجات الأكثر مبيعًا
      context.read<ProductsCubit>().getProducts();
    } else {
      // إذا كان هناك استعلام، نبحث عن المنتجات
      context.read<ProductsCubit>().searchProducts(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: 16),
                SearchTextField(
                    onChanged: _onSearch,
                ),
                SizedBox(height: 12),
                FeaturedList(
                  
                ),
                SizedBox(height: 12),
                BestSellingHeader(
                  
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingSliverGridBlocBuilder(),
        ],
      ),
    );
  }
}
