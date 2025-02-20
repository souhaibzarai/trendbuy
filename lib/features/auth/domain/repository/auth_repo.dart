import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/auth/data/models/user_create.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreation user);
}
