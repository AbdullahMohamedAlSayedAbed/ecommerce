import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: kTopPadding),
                    customAppBar(
                      context,
                      title: 'السلة',
                      showNotification: false,
                    ),
                    SizedBox(height: 16),
                    CartHeader(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              CartItemList(
                cartItems: [],
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .1,
            left: 16,
            right: 16,
            child: CustomButton(onPressed: () {}, text: 'الدفع  120جنيه'),
          ),
        ],
      ),
    );
  }
}
