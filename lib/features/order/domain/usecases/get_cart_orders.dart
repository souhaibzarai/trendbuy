import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/order/domain/repository/order.dart';
import 'package:trendbuy/service_locator.dart';

class GetCartOrdersUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await serviceLocator<OrderRepository>().getCartOrders();
  }
}
