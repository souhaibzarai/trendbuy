import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../repository/auth_repo.dart';
import '../../../../service_locator.dart';

class AgesUseCase implements Usecase<Either, dynamic> {
  //

  @override
  Future<Either> call({dynamic params}) async {
    return await serviceLocator<AuthRepository>().getAges();
  }
}
