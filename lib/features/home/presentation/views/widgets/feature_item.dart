import 'package:ecommerce/core/utils/app_images.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/feature_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width - 32;
    return Container(
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              right: width * .4,
              bottom: 0,
              top: 0,
              left: 0,
              child: Image.asset(Assets.imagesWatermelon, fit: BoxFit.fill),
            ),
            Container(
              width: width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: svg.Svg(Assets.imagesFeaturedItemBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 33.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'عروض العيد',
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      'خصم 25%',
                      style: TextStyles.bold16.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 11),
                    FeatureItemButton(text: 'تسوق الآن', onPressed: () {}),
                    SizedBox(height: 29),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
