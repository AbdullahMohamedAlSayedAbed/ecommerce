import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:ecommerce/features/auth/presentation/cubit/change_password_cubit/change_password_cubit.dart';
import 'package:ecommerce/features/auth/presentation/views/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChangePasswordCubit(
          getIt<AuthRepo>()
        ),
        child: ChangePasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
