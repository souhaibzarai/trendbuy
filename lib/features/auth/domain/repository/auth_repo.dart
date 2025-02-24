import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/auth/data/models/user_sign_in.dart';
import '../../data/models/user_create.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreation user);

  Future<Either> getAges();

  Future<Either> signIn(UserSignIn user);

  Future<Either> sendPasswordResetEmail(String email);
}
