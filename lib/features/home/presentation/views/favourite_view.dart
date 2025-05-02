import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  getIt.get<FavoriteCubit>()..getFavorites(),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'المفضلة',
          showBackButton: true,
          showNotification: false,
        ),
        body: FavoriteViewBody(),
      ),
    );
  }
}
