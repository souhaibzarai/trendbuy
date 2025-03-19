import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../../data/models/add_to_cart.dart';
import '../repository/order.dart';
import '../../../../service_locator.dart';

class AddToCartUseCase extends Usecase<Either, AddToCartModel> {
  @override
  Future<Either> call({AddToCartModel? params}) async {
    return await serviceLocator<OrderRepository>().addToCart(params!);
  }
}
