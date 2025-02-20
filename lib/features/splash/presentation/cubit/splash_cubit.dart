import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/splash/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(milliseconds: 1300), //
    );
    emit(UnAuthenticated());
  }
}
