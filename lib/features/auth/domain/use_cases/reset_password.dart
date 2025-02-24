import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';
import 'package:trendbuy/service_locator.dart';

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
