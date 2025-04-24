import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/forgot_password_view_body.dart';
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

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouter.login,
            (route) => false,
          );
        } else if (state is ForgotPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ForgotPasswordLoading,
          child: ForgotPasswordViewBody(),
        );
      },
    );
  }
}
