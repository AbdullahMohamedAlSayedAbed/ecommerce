import 'package:ecommerce/core/utils/app_images.dart';

class BottomNavigationEntity {
  final String activeImage, inActiveImage;
  final String title;
  BottomNavigationEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.title,
  });
}

List<BottomNavigationEntity> get bottomNavigationsBarItem => [
  BottomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldHome,
    inActiveImage: Assets.imagesVuesaxOutlineHome,
    title: "الرئيسية",
  ),
  BottomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldProducts,
    inActiveImage: Assets.imagesVuesaxOutlineProducts,
    title: "المنتجات",
  ),
  BottomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldShoppingCart,
    inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
    title: "سلة التسوق",
  ),
  BottomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldUser,
    inActiveImage: Assets.imagesVuesaxOutlineUser,
    title: "حسابي",
  ),
];
