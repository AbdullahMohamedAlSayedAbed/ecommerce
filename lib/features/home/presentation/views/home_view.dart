import 'package:ecommerce/features/home/presentation/views/custom_button_navigation_bar.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
      body: HomeViewBody(),
    );
  }
}
