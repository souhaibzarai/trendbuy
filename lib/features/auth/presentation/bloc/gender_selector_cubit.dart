import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectorCubit extends Cubit<int> {
  GenderSelectorCubit() : super(1);

  int selectedIndex = 1;

  void selectIndex(int index) {
    selectedIndex = index;
    emit(index);
  }
}
