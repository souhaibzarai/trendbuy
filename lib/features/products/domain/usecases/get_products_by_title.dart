import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../repository/products_repo.dart';
import '../../../../service_locator.dart';

class GetProductsByTitleUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<ProductsRepository>().fetchProductsByTitle(
      params!,
    );
  }
}
