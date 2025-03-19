import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../repository/order.dart';
import '../../../../service_locator.dart';

class GetCartOrdersUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await serviceLocator<OrderRepository>().getCartOrders();
  }
}
