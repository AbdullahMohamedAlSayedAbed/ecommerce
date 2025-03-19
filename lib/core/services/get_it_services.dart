import 'package:ecommerce/core/repos/product_repo/product_repo.dart';
import 'package:ecommerce/core/repos/product_repo/product_repo_impl.dart';
import 'package:ecommerce/core/services/auth_services.dart';
import 'package:ecommerce/core/services/database_service.dart';
import 'package:ecommerce/core/services/firebase_auth_services.dart';
import 'package:ecommerce/core/services/firestore_service.dart';
import 'package:ecommerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:ecommerce/features/auth/domin/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthServices>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ProductsRepo>(
    ProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      databaseService: getIt<DatabaseService>(),
      authServices: getIt<AuthServices>(),
    ),
  );
}
