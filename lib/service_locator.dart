import 'package:get_it/get_it.dart';
import 'package:trendbuy/features/auth/domain/use_cases/reset_password.dart';
import 'package:trendbuy/features/auth/domain/use_cases/sign_in.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/data/sources/firebase_auth_service.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/use_cases/ages.dart';
import 'features/auth/domain/use_cases/sign_up.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(), //
  );

  // Repository
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(), //
  );

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
}
