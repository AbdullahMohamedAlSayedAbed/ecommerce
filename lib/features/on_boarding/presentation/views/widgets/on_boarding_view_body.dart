import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageview(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color:
                currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(.5),
          ),
        ),
        const SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomButton(onPressed: () {}, text: 'ابدأ الان'),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
