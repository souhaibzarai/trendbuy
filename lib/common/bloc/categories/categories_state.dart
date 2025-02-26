import 'package:trendbuy/features/category/domain/entities/category.dart';

abstract class CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  List<CategoryEntity> categories;

  CategoriesLoaded({
    required this.categories, //
  });
}

class LoadCategoriesFailed extends CategoriesState {
  final String errMsg;

  LoadCategoriesFailed({
    required this.errMsg, //
  });
}
