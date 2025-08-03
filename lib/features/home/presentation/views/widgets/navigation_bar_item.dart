import 'package:ecommerce/features/home/domin/entites/bottom_navigation_entity.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/in_active_item.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationEntity,
  });

  final bool isActive;
  final BottomNavigationEntity bottomNavigationEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),     
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child:
          isActive
              ? ActiveItem(
                key: const ValueKey('active'),
                icon: bottomNavigationEntity.activeImage,
                text: bottomNavigationEntity.title,
              )
              : InActiveItem(
                key: const ValueKey('inactive'),
                icon: bottomNavigationEntity.inActiveImage,
              ),
    );
  }
}
