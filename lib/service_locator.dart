import 'package:get_it/get_it.dart';
import 'package:trendbuy/features/products/domain/usecases/get_products_by_title.dart';

import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/data/sources/firebase_auth_service.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/use_cases/get_ages.dart';
import 'features/auth/domain/use_cases/get_user.dart';
import 'features/auth/domain/use_cases/reset_password.dart';
import 'features/auth/domain/use_cases/sign_in.dart';
import 'features/auth/domain/use_cases/sign_up.dart';
import 'features/auth/domain/use_cases/user_status.dart';
import 'features/category/data/repository/category_repo_impl.dart';
import 'features/category/data/sources/categories_firebase_service.dart';
import 'features/category/domain/repository/category_repo.dart';
import 'features/category/domain/usecases/get_categories.dart';
import 'features/products/data/repository/products_repo_impl.dart';
import 'features/products/data/sources/products_firebase_source.dart';
import 'features/products/domain/repository/products_repo.dart';
import 'features/products/domain/usecases/get_new_in.dart';
import 'features/products/domain/usecases/get_products_by_category_id.dart';
import 'features/products/domain/usecases/get_top_selling.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(), //
  );

  serviceLocator.registerSingleton<CategoriesFirebaseService>(
    CategoriesFirebaseServiceImpl(), //
  );

  serviceLocator.registerSingleton<ProductsFirebaseSource>(
    ProductsFirebaseSourceImpl(), //
  );

  // end services

  // Repository
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(), //
  );

  serviceLocator.registerSingleton<CategoryRepository>(
    CategoryRepoImpl(), //
  );

  serviceLocator.registerSingleton<ProductsRepository>(
    ProductsRepositoryImpl(), //
  );

  // end Repository

  // Usecases
  serviceLocator.registerSingleton<SignUpUseCase>(
    SignUpUseCase(), //
  );

  serviceLocator.registerSingleton<AgesUseCase>(
    AgesUseCase(), //
  );

  serviceLocator.registerSingleton<SignInUsecase>(
    SignInUsecase(), //
  );

  serviceLocator.registerSingleton<ResetPasswordUsecase>(
    ResetPasswordUsecase(), //
  );

  serviceLocator.registerSingleton<UserStatusUseCase>(
    UserStatusUseCase(), //
  );

  serviceLocator.registerSingleton<GetUserUsecase>(
    GetUserUsecase(), //
  );

  serviceLocator.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(), //
  );

  serviceLocator.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase(), //
  );

  serviceLocator.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase(), //
  );

  serviceLocator.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase(), //
  );

  serviceLocator.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase(), //
  );

  // end Usecases
}
