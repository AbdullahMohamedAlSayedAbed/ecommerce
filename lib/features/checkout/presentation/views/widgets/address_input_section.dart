import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart'
    show OrderEntity;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: context.read<OrderEntity>().autoValidateMode,

        builder: (context, mode, child) {
          return Form(
            autovalidateMode: mode,
            key: context.read<OrderEntity>().formKey,
            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.name = value;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.email = value;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.address = value;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.city = value;
                  },
                  hintText: 'المدينة',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.addressDetails =
                        value;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress?.phone = value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.number,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
