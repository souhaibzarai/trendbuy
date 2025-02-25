import '../../../../common/usecase.dart';
import '../repository/auth_repo.dart';
import '../../../../service_locator.dart';

class UserStatusUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await serviceLocator<AuthRepository>().isLoggedIn();
  }
}
