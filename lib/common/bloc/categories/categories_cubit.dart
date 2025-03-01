import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/category/domain/usecases/get_categories.dart';
import '../../../service_locator.dart';
import 'categories_state.dart';

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
