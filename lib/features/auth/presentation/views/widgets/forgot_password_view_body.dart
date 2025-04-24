import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String emailAddress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 30,
            children: [
              const SizedBox(height: kTopPadding),
              Text(
                'لا تقلق ، ما عليك سوى كتابة البريد الكتروني و سنرسل رمز التحقق.',
                style: TextStyles.semiBold16.copyWith(
                  color: const Color(0xFF616A6B),
                ),
              ),
              CustomTextFormField(
                onSaved: (email) {
                  emailAddress = email!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<ForgotPasswordCubit>().sendPasswordResetEmail(
                      emailAddress,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'نسيت كلمة المرور',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
