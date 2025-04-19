import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart'
    show OrderInputEntity;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: context.read<OrderInputEntity>().autoValidateMode,

        builder: (context, mode, child) {
          return Form(
            autovalidateMode: mode,
            key: context.read<OrderInputEntity>().formKey,
            child: Column(
              spacing: 16,
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddress?.name =
                        value;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddress?.email =
                        value;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddress?.address =
                        value;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddress?.city =
                        value;
                  },
                  hintText: 'المدينة',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context
                        .read<OrderInputEntity>()
                        .shippingAddress
                        ?.addressDetails = value;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddress?.phone =
                        value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.number,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
