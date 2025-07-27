import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:ecommerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }


  void executeNavigation() {
    bool isOnBoarding = Prefs.getBool(kIsOnBoardingViewSeen);
    bool isLogin = getIt<AuthServices>().isSignIn();
    bool isEmailVerified = getIt<AuthServices>().emailVerified();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; 
      if (!isOnBoarding) {
        Navigator.pushReplacementNamed(context, AppRouter.onBoarding,);
      } else {
        if (isLogin && isEmailVerified) {
          Navigator.pushReplacementNamed(context, AppRouter.home);
        } else {
          Navigator.pushReplacementNamed(context, AppRouter.login);
        }
      }
    });
  }
}
