import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_header.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                cartItems: context.watch<CartCubit>().cart.cartItems,
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .1,
            left: 16,
            right: 16,
            child: CustomCartButton(),
          ),
        ],
      ),
    );
  }
}
