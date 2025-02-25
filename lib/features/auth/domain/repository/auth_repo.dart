import 'package:dartz/dartz.dart';

import '../../data/models/user_create.dart';
import '../../data/models/user_sign_in.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreation user);

  Future<Either> getAges();

  Future<Either> signIn(UserSignIn user);

  Future<Either> sendPasswordResetEmail(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();
}
