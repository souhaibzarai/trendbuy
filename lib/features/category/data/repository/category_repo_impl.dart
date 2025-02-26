import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/category/domain/repository/category_repo.dart';
import 'package:trendbuy/service_locator.dart';

import '../models/category.dart';

class CategoryRepoImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    try {
      final categories =
          await serviceLocator<CategoryRepository>().getCategories();
      return categories.fold(
        (error) => Left('Error while fetching categories'),
        (categories) => Right(
          CategoryModel.fromJson(categories).toEntity(), //
        ),
      );
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }
}
