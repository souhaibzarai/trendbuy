import 'package:dartz/dartz.dart';

import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/products_repo.dart';

class GetProductsByCategoryIdUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<ProductsRepository>().fetchProductsByCategory(
      params!,
    );
  }
}
