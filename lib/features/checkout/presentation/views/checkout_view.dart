import 'package:ecommerce/core/helper/get_user.dart';
import 'package:ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:ecommerce/features/checkout/presentation/cubits/cubit/add_order_cubit.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_steps.dart' show getSteps;
import 'package:ecommerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:ecommerce/features/home/domin/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late PageController pageController;
  late OrderInputEntity orderEntity; // تعريف OrderEntity كمتغير في الـ State

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      uID: getUser().id,
      cartEntity: widget.cartEntity,
    );
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: getSteps()[currentIndex],
          showNotification: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocConsumer(
            child: CheckoutViewBody(
              currentIndex: currentIndex,
              pageController: pageController,
            ),
          ),
        ),
      ),
    );
  }
}
