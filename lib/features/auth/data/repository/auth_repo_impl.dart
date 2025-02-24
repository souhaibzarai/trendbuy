import 'package:dartz/dartz.dart';
import '../models/user_sign_in.dart';
import '../models/user_create.dart';
import '../sources/firebase_auth_service.dart';
import '../../domain/repository/auth_repo.dart';
import '../../../../service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signUp(UserCreation user) async {
    return await serviceLocator<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() async {
    return await serviceLocator<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignIn user) async {
    return await serviceLocator<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await serviceLocator<AuthFirebaseService>().sendPasswordResetEmail(
      email,
    );
  }
}
