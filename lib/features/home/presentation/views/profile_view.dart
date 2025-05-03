import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/gangrel_profile_view_widget.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/logout_widget.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/profile_date.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          customAppBar(
            context,
            title: 'حسابي',
            showBackButton: false,
            showNotification: false,
          ),
          const SizedBox(height: kTopPadding),
          ProfileDate(),
          const SizedBox(height: 20),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('عام', style: TextStyles.semiBold13),
          ),
          const SizedBox(height: 20),
          Column(
            spacing: 4,
            children: [
              GangrelProfileViewWidget(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.favorite);
                },
                icon: Icons.favorite_border,
                name: 'المفضلة',
              ),
              GangrelProfileViewWidget(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.changePassword);
                },
                icon: Icons.password,
                name: 'إنشاء كلمة مرور جديدة',
              ),
            ],
          ),
          Spacer(),
          LogoutWidget(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
