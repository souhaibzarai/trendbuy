import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/order/data/models/add_to_cart.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartModel addToCartRequest);

  Future<Either> getCartOrders();
}
