import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/auth/data/models/user_create.dart';
import 'package:trendbuy/features/auth/domain/repository/auth_repo.dart';
import 'package:trendbuy/service_locator.dart';

class SignUpUseCase implements Usecase<Either, UserCreation> {
  @override
  Future<Either> call({UserCreation? params}) async {
    return await serviceLocator<AuthRepository>().signUp(params!);
  }
}
