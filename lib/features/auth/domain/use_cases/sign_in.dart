import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../../data/models/user_sign_in.dart';
import '../repository/auth_repo.dart';

class SignInUsecase extends Usecase<Either, UserSignIn> {
  @override
  Future<Either> call({UserSignIn? params}) async {
    if (params == null) {
      return const Left('User Login parameters cannot be null');
    }
    return await serviceLocator<AuthRepository>().signIn(params);
  }
}
