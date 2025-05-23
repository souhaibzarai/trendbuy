import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/cubit/categories/categories_cubit.dart';
import '../../../../common/cubit/categories/categories_state.dart';
import '../../../../common/widgets/category/category_column.dart';
import '../../../../common/widgets/custom_section.dart';
import '../../../../utils/constants/constants.dart';
import '../../../category/domain/entities/category.dart';
import '../../../category/presentation/screens/all_categories.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => CategoriesCubit()..displayCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return AppCommons.centerProgressIndicator;
          } //
          else if (state is CategoriesLoaded) {
            return CustomSection(
              sectionName: 'Categories',
              haveButton: true,
              buttonText: 'See All',
              onTap: () {
                AppNavigator.push(context, widget: AllCategoriesScreen());
              },
              widget: categories(
                context,
                state.categories, //
              ),
            );
          } //
          else if (state is LoadCategoriesFailed) {
            AppCommons.showScaffold(context, message: state.errMsg);
            return Center(
              child: Text('Failed to load categories: ${state.errMsg}'),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

Widget categories(BuildContext context, List<CategoryEntity> categories) {
  return SizedBox(
    height: 120,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder:
          (context, index) => AppConstants.verticalTransparentDivider,
      itemBuilder:
          (context, index) => categoryColumn(
            context,
            categories[index], //
          ),
    ),
  );
}
