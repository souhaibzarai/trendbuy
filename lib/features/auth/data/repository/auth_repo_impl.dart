import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
import '../../domain/repository/auth_repo.dart';
import '../models/user_create.dart';
import '../models/user_sign_in.dart';
import '../sources/firebase_auth_service.dart';

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

  @override
  Future<bool> isLoggedIn() async {
    return await serviceLocator<AuthFirebaseService>().isLoggedIn();
  }
}
