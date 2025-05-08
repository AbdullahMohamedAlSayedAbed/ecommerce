import 'package:ecommerce/core/helper/on_generate_router.dart';
import 'package:ecommerce/core/services/get_it_services.dart';
import 'package:ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_bloc_opserver.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<CartItemCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<CartCubit>(),
            ),
            BlocProvider(
              create: (context) =>  getIt.get<FavoriteCubit>(),
            ),
          ],
          child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
