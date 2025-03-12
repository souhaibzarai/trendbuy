import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectorCubit extends Cubit<String> {
  AgeSelectorCubit() : super('Age Range');

  String selectedAge = 'Age Range';

  void selectAge(String age) {
    selectedAge = age;
    emit(age);
  }
}
