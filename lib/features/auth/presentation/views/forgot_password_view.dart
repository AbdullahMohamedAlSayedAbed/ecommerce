import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/forgot_password_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'نسيان كلمة المرور',
          showNotification: false,
        ),
        body: ForgotPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
