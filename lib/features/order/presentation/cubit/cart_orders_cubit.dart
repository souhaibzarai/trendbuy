import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/order/domain/usecases/get_cart_orders.dart';
import 'package:trendbuy/features/order/presentation/cubit/cart_orders_state.dart';
import 'package:trendbuy/service_locator.dart';

class CartOrdersCubit extends Cubit<CartOrdersState> {
  CartOrdersCubit() : super(CartOrdersInitial());

  void getCartOrder() async {
    emit(CartOrdersLoading());

    try {
      final cartOrders = await serviceLocator<GetCartOrdersUseCase>().call();

      return cartOrders.fold(
        (error) {
          emit(LoadCartOrdersFailed(errMsg: error.toString()));
        },
        (orders) {
          emit(CartOrdersLoaded(cartOrders: orders));
        },
      );
    } catch (e) {
      emit(LoadCartOrdersFailed(errMsg: e.toString()));
    }
  }
}
