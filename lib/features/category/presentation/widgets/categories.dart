import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/common/bloc/categories/categories_cubit.dart';
import 'package:trendbuy/common/bloc/categories/categories_state.dart';
import 'package:trendbuy/features/category/domain/entities/category.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => CategoriesCubit()..displayCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(), //
            );
          } else if (state is CategoriesLoaded) {
            return Column(
              children: [
                seeAll(context),
                const SizedBox(height: 15), //
                categories(context, state.categories),
              ],
            );
          } else if (state is LoadCategoriesFailed) {
            print(state.errMsg);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppCommons.showScaffold(context, message: state.errMsg);
            });
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
      itemCount: 5,
      separatorBuilder:
          (context, index) => VerticalDivider(
            width: 30,
            color: Colors.transparent, //
          ),
      itemBuilder:
          (context, index) => category(
            categories[index], //
          ),
    ),
  );
}

Widget category(CategoryEntity category) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.image), //
          ),
          shape: BoxShape.circle,
        ),
      ),

      SizedBox(height: 8), //
      Text(category.title),
    ],
  );
}

Widget seeAll(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Categories',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      GestureDetector(
        child: Text(
          'See All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
        ), //
      ),
    ],
  );
}
