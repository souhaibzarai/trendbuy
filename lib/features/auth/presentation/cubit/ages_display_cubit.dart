import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/use_cases/get_ages.dart';
import 'ages_display_state.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  Future<void> displayAges() async {
    var response = await serviceLocator<AgesUseCase>().call();
    response.fold(
      (errorMsg) {
        emit(
          AgesLoadFailure(errMsg: errorMsg.toString()), //
        );
      },
      (ages) {
        emit(
          AgesLoaded(ages: ages), //
        );
      }, //
    );
  }
}
