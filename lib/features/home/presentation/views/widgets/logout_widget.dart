import 'package:ecommerce/core/helper/build_show_diaglo.dart';
import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      showLogoutDialog(context, (){
        Navigator.pop(context);
        getIt<AuthServices>().signOut();
        Navigator.pushNamedAndRemoveUntil(context, AppRouter.login, (route) => false);
      });  
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(color: const Color(0xFFEBF9F1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'تسجيل الخروج',
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Spacer(),
            Transform.rotate(
              angle: 3.14,
              child: Icon(
                Icons.logout,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
