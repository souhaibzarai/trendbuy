import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSlideCubit extends Cubit<int> {
  ImageSlideCubit() : super(0);

  void updateImageIndex(index) {
    emit(index);
  }
}
