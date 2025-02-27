import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'تسجيل الدخول',
        showNotification: false,
      ),
      body: SigninViewBody(),
    );
  }
}
