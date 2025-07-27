import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          getIt<AuthServices>().sendEmailVerification();
          showCustomToast(
            message: 'لقد تم انشاء الحساب بنجاح تحقق من بريدك الإلكتروني',
            type: ToastType.success,
          );
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          showCustomToast(message: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignupLoading,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
