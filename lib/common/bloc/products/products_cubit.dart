import 'package:flutter_bloc/flutter_bloc.dart';

import '../../usecase.dart';
import 'products_state.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  ProductsDisplayCubit({required this.usecase}) : super(ProductsLoading());

  final Usecase usecase;

  void displayProducts({dynamic params}) async {
    try {
      final returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {
          print(error);
          emit(LoadProductsFailure(error));
        },
        (data) {
          emit(ProductsLoaded(data));
        }, //
      );

      // Your code here
    } catch (e, stackTrace) {
      emit(LoadProductsFailure(e.toString()));
      print('Error details: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
