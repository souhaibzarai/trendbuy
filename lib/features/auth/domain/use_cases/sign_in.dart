import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/auth/data/models/user_sign_in.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';
import 'package:trendbuy/service_locator.dart';

class SignInUsecase extends Usecase<Either, UserSignIn> {
  @override
  Future<Either> call({UserSignIn? params}) async {
    if (params == null) {
      return const Left('User Login parameters cannot be null');
    }
    return await serviceLocator<AuthRepository>().signIn(params);
  }
}
