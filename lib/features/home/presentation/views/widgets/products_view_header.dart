import 'package:ecommerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/home/presentation/views/functions/build_order_price_show_model.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/price_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productLength});
  final int productLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productLength نتايج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16.copyWith(color: Color(0xFF0C0D0D)),
        ),
        InkWell(
          onTap: () {
            buildOrderPriceShowModal(context);
          },
          child: SafeArea(
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0x66CACECE)),
                  borderRadius: BorderRadius.circular(4),
                ),
                color: Colors.white.withAlpha(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SvgPicture.asset(Assets.imagesFilter2),
            ),
          ),
        ),
      ],
    );
  }

}

