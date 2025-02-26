import 'package:dartz/dartz.dart';
import 'package:trendbuy/common/usecase.dart';
import 'package:trendbuy/features/category/domain/repository/category_repo.dart';
import 'package:trendbuy/service_locator.dart';

class GetCategoriesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<CategoryRepository>().getCategories();
  }
}
