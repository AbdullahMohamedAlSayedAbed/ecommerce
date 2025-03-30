import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/views/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'تسجيل الدخول',
          showNotification: false,
          showBackButton: false,
        ),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
