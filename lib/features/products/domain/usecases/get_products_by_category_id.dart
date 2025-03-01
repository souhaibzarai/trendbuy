import 'package:dartz/dartz.dart';
import '../repository/products_repo.dart';
import '../../../../common/usecase.dart';
import '../../../../service_locator.dart';

class GetProductsByCategoryIdUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<ProductsRepository>().fetchProductsByCategory(
      params!,
    );
  }
}
