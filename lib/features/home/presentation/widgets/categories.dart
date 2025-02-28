import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/common/bloc/categories/categories_cubit.dart';
import 'package:trendbuy/common/bloc/categories/categories_state.dart';
import 'package:trendbuy/common/widgets/custom_section.dart';
import 'package:trendbuy/features/category/domain/entities/category.dart';

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
            return CustomSection(
              sectionName: 'Categories',
              haveButton: true,
              buttonText: 'See All',
              onTap: () {},
              widget: categories(
                context,
                state.categories, //
              ),
            );
          } else if (state is LoadCategoriesFailed) {
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
            image: NetworkImage(category.image),
            alignment: Alignment.center,
            fit: BoxFit.contain, //
          ),
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(height: 8), //
      Text(category.title, style: TextStyle(fontSize: 11)),
    ],
  );
}
