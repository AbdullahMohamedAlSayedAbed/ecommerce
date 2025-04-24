import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String _email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 30,
          children: [
            Text(
              'لا تقلق ، ما عليك سوى كتابة البريد الكتروني وسنرسل رمز التحقق.',
            ),
            CustomTextFormField(
              onSaved: (email) {
                _email = email!;
              },
              hintText: 'البريد الالكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Call the forgot password function here
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
    );
  }
}
