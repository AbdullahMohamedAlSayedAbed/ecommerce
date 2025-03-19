import 'package:ecommerce/features/home/domin/entites/bottom_navigation_entity.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;
  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: List.generate(
            bottomNavigationsBarItem.length,
            (index) => Expanded(
              flex: index == currentIndex ? 3 : 2,
              child: InkWell(
                onTap: () => setState(() {
                  currentIndex = index;
                  widget.onChanged(index);
                }),
                child: NavigationBarItem(
                  isActive: index == currentIndex,
                  bottomNavigationEntity: bottomNavigationsBarItem[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
