import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/features/home/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/image_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileDate extends StatelessWidget {
  const ProfileDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProfileCubit(getIt.get<ImagesRepo>(), getIt<DatabaseService>()),
      child: Column(
        spacing: 10,
        children: [
          ImageProfileWidget(),
          Text(
            getUser().name,
            style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
          ),
          Text(
            getUser().email,
            style: TextStyles.regular16.copyWith(
              color: const Color(0xFF888FA0),
            ),
          ),
        ],
      ),
    );
  }
}
