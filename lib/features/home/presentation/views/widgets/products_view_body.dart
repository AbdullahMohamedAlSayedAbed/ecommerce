import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/search_text_field.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/best_selling_sliver_grid_bloc_builder.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<ProductsCubit>().getProducts();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: kTopPadding),
                    customAppBar(
                      context,
                      title: 'المنتجات',
                      showBackButton: false,
                    ),
                    SizedBox(height: 16),
                    SearchTextField(onChanged: _onSearch),
                    SizedBox(height: 12),
                    BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, state) {
                        final length =
                            state is ProductsSuccess ? state.products.length : 0;
                        return ProductsViewHeader(productLength: length);
                      },
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              BestSellingSliverGridBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
