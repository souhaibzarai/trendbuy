import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../usecase.dart';
import 'button_state.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required Usecase useCase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(Duration(milliseconds: 200));
    try {
      Either returnedData = await useCase.call(params: params);

      returnedData.fold(
        (failure) {
          emit(ButtonFailureState(failure.toString()));
        },
        (success) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(e.toString()));
    }
  }
}
