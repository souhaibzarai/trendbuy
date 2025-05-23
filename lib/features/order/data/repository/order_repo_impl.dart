import 'package:dartz/dartz.dart';
import '../models/add_to_cart.dart';
import '../models/cart_orders.dart';
import '../source/order_firebase_source.dart';
import '../../domain/repository/order.dart';
import '../../../../service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToCart(AddToCartModel addToCartRequest) async {
    return await serviceLocator<OrderFirebaseSource>().addToCart(
      addToCartRequest,
    );
  }

  @override
  Future<Either> getCartOrders() async {
    try {
      final returnedData =
          await serviceLocator<OrderFirebaseSource>().getCartOrders();

      return returnedData.fold(
        (error) => Left('Error Occurred, $error'), //
        (data) => Right(
          List.from(
            data,
          ).map((e) => CartOrdersModel.fromJson(e).toEntity()).toList(),
        ),
      );
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }
}
