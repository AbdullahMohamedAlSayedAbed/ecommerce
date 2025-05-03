import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderImageProductDetails extends StatelessWidget {
  const HeaderImageProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Stack(
        children: [
          Positioned(
            left: -258,
            top: -530,
            child: Container(
              width: 906,
              height: 906,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3F5F7),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withValues(alpha: 51),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 80,
            right: 50,
            child: CustomNetworkImage(
              imageUrl: Provider.of<ProductEntity>(context).imageUrl!,
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CircleAvatar(
                  backgroundColor: AppColors.lightSecondaryColor,
                  child: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
