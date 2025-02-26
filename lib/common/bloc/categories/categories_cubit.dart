import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/bloc/categories/categories_state.dart';
import 'package:trendbuy/features/category/domain/usecases/get_categories.dart';
import 'package:trendbuy/service_locator.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoading());

  void displayCategories() async {
    final returnedData = await serviceLocator<GetCategoriesUseCase>().call();

    returnedData.fold(
      (error) {
        return Left(emit(LoadCategoriesFailed(errMsg: error)));
      },
      (categories) {
        return Right(emit(CategoriesLoaded(categories: categories)));
      },
    );
  }
}
