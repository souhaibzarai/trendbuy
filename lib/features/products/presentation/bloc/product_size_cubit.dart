import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeCubit extends Cubit<int> {
  ProductSizeCubit() : super(0);

  int selectedSizeIndex = 0;
  void selectSize(int index) {
    selectedSizeIndex = index;
    emit(index);
  }
}
