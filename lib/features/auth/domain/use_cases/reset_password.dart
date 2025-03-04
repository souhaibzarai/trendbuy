import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/auth_repo.dart';

class ResetPasswordUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    if (params == null) {
      return Left('Please enter a valid email');
    }
    return await serviceLocator<AuthRepository>().sendPasswordResetEmail(
      params,
    );
  }
}
