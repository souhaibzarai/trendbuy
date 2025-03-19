import '../../domain/entities/cart_orders.dart';

abstract class CartOrdersState {}

final class CartOrdersInitial extends CartOrdersState {}

final class CartOrdersLoading extends CartOrdersState {}

final class CartOrdersLoaded extends CartOrdersState {
  final List<CartOrdersEntity> cartOrders;

  CartOrdersLoaded({required this.cartOrders});
}

final class LoadCartOrdersFailed extends CartOrdersState {
  final String errMsg;

  LoadCartOrdersFailed({required this.errMsg});
}
