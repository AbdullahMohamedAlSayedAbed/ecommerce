import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'نسيان كلمة المرور',
        showNotification: false,
      ),
      body: ForgotPasswordViewBody(),
    );
  }
}
