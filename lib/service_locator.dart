import 'package:get_it/get_it.dart';
import 'package:trendbuy/features/auth/domain/use_cases/get_user.dart';
import 'package:trendbuy/features/category/data/repository/category_repo_impl.dart';
import 'package:trendbuy/features/category/data/sources/categories_firebase_service.dart';
import 'package:trendbuy/features/category/domain/repository/category_repo.dart';
import 'features/auth/domain/use_cases/reset_password.dart';
import 'features/auth/domain/use_cases/sign_in.dart';
import 'features/auth/domain/use_cases/user_status.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/data/sources/firebase_auth_service.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/use_cases/get_ages.dart';
import 'features/auth/domain/use_cases/sign_up.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(), //
  );

  serviceLocator.registerSingleton<CategoriesFirebaseService>(
    CategoriesFirebaseServiceImpl(),
  );

  // end services

  // Repository
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(), //
  );

  serviceLocator.registerSingleton<CategoryRepository>(
    CategoryRepoImpl(), //
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

  // end Usecases
}
