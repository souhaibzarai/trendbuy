import '../../../auth/domain/entities/user.dart';

abstract class UserInfoDisplayState {}

final class UserInfoLoading extends UserInfoDisplayState {}

final class UserInfoLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoLoaded({required this.user});
}

final class UserInfoFailure extends UserInfoDisplayState {
  final String errMsg;

  UserInfoFailure({required this.errMsg});
}
