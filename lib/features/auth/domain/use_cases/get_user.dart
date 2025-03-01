import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/auth_repo.dart';

class GetUserUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return serviceLocator<AuthRepository>().getUser();
  }
}
