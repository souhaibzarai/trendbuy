import 'package:dartz/dartz.dart';
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
}
