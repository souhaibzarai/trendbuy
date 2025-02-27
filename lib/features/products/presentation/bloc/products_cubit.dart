import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/products/domain/usecases/get_products.dart';
import 'package:trendbuy/features/products/presentation/bloc/products_state.dart';
import 'package:trendbuy/service_locator.dart';

class TopSellingProductsCubit extends Cubit<TopSellingProductsState> {
  TopSellingProductsCubit() : super(TopSellingProductsLoading());

  void displayTopSellingProducts() async {
    try {
      final returnedData = await serviceLocator<GetProductsUseCase>().call();

      returnedData.fold(
        (error) {
          print(error);
          emit(LoadTopSellingProductsFailure(error));
        },
        (data) {
          emit(TopSellingProductsLoaded(data));
        }, //
      );

      // Your code here
    } catch (e, stackTrace) {
      print('Error details: $e');
      print('Stack trace: $stackTrace');
    }
  }
}
