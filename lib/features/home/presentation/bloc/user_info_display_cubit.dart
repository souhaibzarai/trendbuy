import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/auth/domain/use_cases/get_user.dart';
import 'package:trendbuy/features/home/presentation/bloc/user_info_display_state.dart';
import 'package:trendbuy/service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    final returnedData = await serviceLocator<GetUserUsecase>().call();
    returnedData.fold(
      (error) {
        emit(
          UserInfoFailure(errMsg: error.toString()), //
        );
      },
      (data) {
        emit(UserInfoLoaded(user: data));
      }, //
    );
  }
}
