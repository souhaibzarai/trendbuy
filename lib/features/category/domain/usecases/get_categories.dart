import 'package:dartz/dartz.dart';
import '../../../../common/usecase.dart';
import '../repository/category_repo.dart';
import '../../../../service_locator.dart';

class GetCategoriesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<CategoryRepository>().getCategories();
  }
}
