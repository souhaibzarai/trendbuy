import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/products/domain/repository/products_repo.dart';
import 'package:trendbuy/service_locator.dart';

class GetProductsUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<ProductsRepository>().fetchTopSelling();
  }
}
