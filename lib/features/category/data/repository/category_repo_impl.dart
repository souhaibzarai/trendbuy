import 'package:dartz/dartz.dart';
import '../sources/categories_firebase_service.dart';
import '../../domain/repository/category_repo.dart';
import '../../../../service_locator.dart';

import '../models/category.dart';

class CategoryRepoImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    try {
      final categories =
          await serviceLocator<CategoriesFirebaseService>().getCategories();
      return categories.fold(
        (error) => Left('Error while fetching categories'),
        (data) => Right(
          List.from(
            data,
          ).map((e) => CategoryModel.fromJson(e).toEntity()).toList(),
        ),
      );
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }
}
