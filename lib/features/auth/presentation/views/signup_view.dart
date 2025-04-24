import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'حساب جديد',
          showNotification: false,
        ),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
