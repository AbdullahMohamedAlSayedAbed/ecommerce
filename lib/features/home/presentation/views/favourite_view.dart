import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'المفضلة',
        showBackButton: true,
        showNotification: false,
      ),
      body: FavoriteViewBody(),
    );
  }
}
