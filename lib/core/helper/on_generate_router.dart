import 'package:ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:ecommerce/features/best_selling_products/presentation/views/best_selling_view.dart';
import 'package:ecommerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:ecommerce/features/home/presentation/views/main_view.dart';
import 'package:ecommerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:ecommerce/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String home = 'home';
  static const String bestSelling = 'bestSelling';
  static const String checkout = 'checkout';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case home:
        return MaterialPageRoute(builder: (context) => const MainView());
      case bestSelling:
        return MaterialPageRoute(builder: (context) => const BestSellingView());
      case checkout:
        return MaterialPageRoute(builder: (context) =>  CheckoutView(
          cartEntity: settings.arguments as CartEntity
        ));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
