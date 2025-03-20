import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_network_image.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/cart_item_action_button.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(width: 1, color: const Color(0xFFF1F1F5)),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 73,
              height: 92,
              decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
              child: SizedBox(
                width: 53,
                height: 40,
                child: CustomNetworkImage(
                  imageUrl: cartItemEntity.product.imageUrl!,
                ),
              ),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItemEntity.product.title,
                        style: TextStyles.bold13.copyWith(
                          color: const Color(0xFF05161B),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(Assets.imagesTrash),
                      ),
                    ],
                  ),
                  Text(
                    '${cartItemEntity.calculateTotalWeight} كم',
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      CartItemActionButtons(),
                      Spacer(),
                      Text(
                        '${cartItemEntity.calculateTotalPrice} جنيه',
                        style: TextStyles.bold16.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
