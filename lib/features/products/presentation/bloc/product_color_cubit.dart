import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorCubit extends Cubit<int> {
  ProductColorCubit() : super(0);

  int selectedColorIndex = 0;

  void selectColor(int index) {
    selectedColorIndex = index;
    emit(index);
  }
}
