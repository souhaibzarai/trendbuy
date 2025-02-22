import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../../data/models/user_create.dart';
import '../repository/auth_repo.dart';
import '../../../../service_locator.dart';

class SignUpUseCase implements Usecase<Either, UserCreation> {
  @override
  Future<Either> call({UserCreation? params}) async {
    return await serviceLocator<AuthRepository>().signUp(params!);
  }
}
