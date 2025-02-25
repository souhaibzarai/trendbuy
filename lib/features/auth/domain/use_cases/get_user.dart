import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';
import 'package:trendbuy/service_locator.dart';

class GetUserUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return serviceLocator<AuthRepository>().getUser();
  }
}
