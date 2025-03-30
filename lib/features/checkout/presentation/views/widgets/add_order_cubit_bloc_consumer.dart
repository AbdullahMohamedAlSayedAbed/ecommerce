import 'package:ecommerce/core/helper/show_custom_toast.dart';
import 'package:ecommerce/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce/features/checkout/presentation/cubits/cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showCustomToast(
            message: 'تم اضافة الطلب بنجاح',
            type: ToastType.success,
          );
        } else if (state is AddOrderFailure) {
          showCustomToast(message: state.error, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
