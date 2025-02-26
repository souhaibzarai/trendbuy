import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/category/data/sources/categories_firebase_service.dart';
import 'package:trendbuy/features/category/domain/repository/category_repo.dart';
import 'package:trendbuy/service_locator.dart';

import '../models/category.dart';

class CategoryRepoImpl implements CategoryRepository {
  @override
  Future<Either> getCategories() async {
    try {
      final categories =
          await serviceLocator<CategoriesFirebaseService>().getCategories();
      print('data from repo is : $categories');
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
