import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/order/data/models/add_to_cart.dart';
import 'package:trendbuy/features/order/domain/repository/order.dart';
import 'package:trendbuy/service_locator.dart';

class AddToCartUseCase extends Usecase<Either, AddToCartModel> {
  @override
  Future<Either> call({AddToCartModel? params}) async {
    return await serviceLocator<OrderRepository>().addToCart(params!);
  }
}
