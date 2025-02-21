import 'package:get_it/get_it.dart';
import 'package:trendbuy/features/auth/data/repository/auth_repo_impl.dart';
import 'package:trendbuy/features/auth/data/sources/firebase_auth_service.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';
import 'package:trendbuy/features/auth/domain/use_cases/sign_up.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // services
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseAuthServiceImpl(), //
  );

  // Repository
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(), //
  );

  // Usecases

  serviceLocator.registerSingleton<SignUpUseCase>(
    SignUpUseCase(), //
  );
}
