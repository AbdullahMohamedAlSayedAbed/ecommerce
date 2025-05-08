import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/custom_button_navigation_bar.dart';
import 'package:ecommerce/features/home/presentation/views/home_view.dart';
import 'package:ecommerce/features/home/presentation/views/products_view.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/main_view_body_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt.get<FavoriteCubit>(),
        ),
      ],

      child: Scaffold(
        bottomNavigationBar: CustomButtonNavigationBar(
          onChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: MainViewBodyBlocListener(currentIndex: currentIndex),
      ),
    );
  }

  Widget getCurrentView() {
    return [HomeView(), ProductsView()][currentIndex];
  }
}
