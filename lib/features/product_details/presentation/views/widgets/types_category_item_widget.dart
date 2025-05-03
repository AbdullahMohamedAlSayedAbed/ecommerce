import 'package:ecommerce/core/entites/product_entity.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/features/product_details/presentation/views/widgets/types_category_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypesCategoryItemWidget extends StatelessWidget {
  const TypesCategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypesCategoryProductWidget(
              image: Assets.imagesRepair,
              title: "عام",
              subTitle: "الصلاحيه",
            ),
            TypesCategoryProductWidget(
              image: Assets.imagesOrganic,
              title:
                  Provider.of<ProductEntity>(context).isOrganic
                      ? "100%"
                      : "0%",
              subTitle: "اوجانيك",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypesCategoryProductWidget(
              image: Assets.imagesCalloirs,
              title:
                  "كالوري ${Provider.of<ProductEntity>(context).numberOfCalories}",
              subTitle: "كيلو جرام",
            ),
            TypesCategoryProductWidget(
              image: Assets.imagesReviews,
              title:
                  "${Provider.of<ProductEntity>(context).reviews?.length} (${Provider.of<ProductEntity>(context).reviews?.length})",
              subTitle: "اوجانيك",
            ),
          ],
        ),
      ],
    );
  }
}
