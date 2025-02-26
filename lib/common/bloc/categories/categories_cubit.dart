import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/bloc/categories/categories_state.dart';
import 'package:trendbuy/features/category/domain/repository/category_repo.dart';
import 'package:trendbuy/service_locator.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  void getCategories() async {
    final categories =
        await serviceLocator<CategoryRepository>().getCategories();

    categories.fold(
      (error) {
        return Left(emit(LoadCategoriesFailed(errMsg: error)));
      },
      (data) {
        return Right(emit(CategoriesLoaded(categories: data)));
      },
    );
  }
}
