import 'package:dartz/dartz.dart';
import '../../data/models/user_create.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreation user);

  Future<Either> getAges();

}
