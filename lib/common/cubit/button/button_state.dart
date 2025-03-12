abstract class ButtonState {}

final class ButtonInitialState extends ButtonState {}

final class ButtonLoadingState extends ButtonState {}

final class ButtonSuccessState extends ButtonState {}

final class ButtonFailureState extends ButtonState {
  final String errMsg;

  ButtonFailureState(this.errMsg);
}
