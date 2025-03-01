import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../repository/products_repo.dart';
import '../../../../service_locator.dart';

class GetNewInUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<ProductsRepository>().fetchNewProducts();
  }
}
