import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/auth/data/models/user_create.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepository {
  @override
  Future<Either> signUp(UserCreation user) {
    throw UnimplementedError();
  }
}
