import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'الاسم كامل',
            textInputType: TextInputType.name,
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.text,
          ),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text,
          ),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
