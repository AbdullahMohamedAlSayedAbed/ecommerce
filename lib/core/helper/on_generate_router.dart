import 'package:ecommerce/core/entites/product_entity.dart' show ProductEntity;
import 'package:ecommerce/features/auth/presentation/views/change_password_view.dart';
import 'package:ecommerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:ecommerce/features/best_selling_products/presentation/views/best_selling_view.dart';
import 'package:ecommerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:ecommerce/features/home/presentation/views/favourite_view.dart';
import 'package:ecommerce/features/home/presentation/views/main_view.dart';
import 'package:ecommerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:ecommerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:ecommerce/features/splash/views/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String forgotPassword = 'forgotPassword';
  static const String home = 'home';
  static const String bestSelling = 'bestSelling';
  static const String checkout = 'checkout';
  static const String favorite = 'favorite';
  static const String productDetails = 'productDetails';
  static const String changePassword = 'changePasswordView';
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
      case forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case home:
        return MaterialPageRoute(builder: (context) => const MainView());
      case bestSelling:
        return MaterialPageRoute(builder: (context) => const BestSellingView());
      case favorite:
        return MaterialPageRoute(builder: (context) => const FavoriteView());
      case changePassword:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordView(),
        );
      case productDetails:
        return MaterialPageRoute(
          builder:
              (context) => ProductDetailsView(
                productEntity: settings.arguments as ProductEntity,
              ),
        );
      case checkout:
        return MaterialPageRoute(
          builder:
              (context) =>
                  CheckoutView(cartEntity: settings.arguments as CartEntity),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          
        ));
    }
  }
}
