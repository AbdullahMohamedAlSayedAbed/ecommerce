import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/firebase_auth_services.dart';
import 'package:ecommerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthServices>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    authServices: getIt<AuthServices>(),
  ));
}