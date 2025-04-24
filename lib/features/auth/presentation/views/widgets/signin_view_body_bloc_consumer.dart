import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess ||
            state is SigninGoogleSuccess ||
            state is SigninFacebookSuccess) {
          if (getIt<AuthServices>().emailVerified()) {
            showCustomToast(
              message: "تم تسجيل الدخول بنجاح",
              type: ToastType.success,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.home,
              (route) => false,
            );
          } else {
            getIt<AuthServices>().sendEmailVerification();
            showCustomToast(
              message: "تحقق من بريدك الإلكتروني",
              type: ToastType.error,
            );
          }
        } else if (state is SigninFailure) {
          showCustomToast(message: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading,
          child: SigninViewBody(),
        );
      },
    );
  }
}
