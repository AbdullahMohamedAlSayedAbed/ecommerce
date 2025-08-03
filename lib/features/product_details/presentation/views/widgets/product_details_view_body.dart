import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/header_image_product_details.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/title_and_ratting_widget.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/types_category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart' as pro;

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        children: [
          HeaderImageProductDetails(),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  TitleAndRattingWidget(),
              const  SizedBox(height: 8),
                Text(
                  " ${pro.Provider.of<ProductEntity>(context).description}",
                  style: TextStyles.regular13,
                ),
               const TypesCategoryItemWidget(),
              const  SizedBox(height: 24),
                CustomButton(
                  onPressed: () {
                    final product = pro.Provider.of<ProductEntity>(
                      context,
                      listen: false,
                    );
                    BlocProvider.of<CartCubit>(context).addProduct(product);
                  },
                  text: 'أضف الي السلة',
                ),
             const   SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
