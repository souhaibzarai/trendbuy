import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/products/domain/repository/products_repo.dart';
import 'package:trendbuy/service_locator.dart';

class GetProductsByTitleUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<ProductsRepository>().fetchProductsByTitle(
      params!,
    );
  }
}
