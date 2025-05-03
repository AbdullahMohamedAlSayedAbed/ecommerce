import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce/core/widgets/password_field.dart';
import 'package:ecommerce/features/auth/presentation/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordViewBodyBlocConsumer extends StatelessWidget {
  const ChangePasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          showCustomToast(message: state.message, type: ToastType.success);
          Navigator.of(context).pop();
        } else if (state is ChangePasswordFailure) {
          showCustomToast(message: state.error, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ChangePasswordLoading,
          child: ChangePasswordViewBody(),
        );
      },
    );
  }
}

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String password1, password2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 34,
            children: [
              customAppBar(
                context,
                title: 'كلمة مرور جديدة',
                showNotification: false,
              ),
              Text(
                'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
                textAlign: TextAlign.right,
                style: TextStyles.semiBold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),

              PasswordField(
                onSaved: (value) {
                  password1 = value!.trim();
                },
              ),
              PasswordField(
                onSaved: (value) {
                  password2 = value!.trim();
                },
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (password1 == password2) {
                      context.read<ChangePasswordCubit>().changePassword(
                        password1,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      showCustomToast(
                        message: 'كلمة المرور غير متطابقة',
                        type: ToastType.error,
                      );
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: 'إنشاء كلمة مرور جديدة',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
