import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/bloc/categories/categories_cubit.dart';
import '../../../../common/bloc/categories/categories_state.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../common/widgets/category/category_row.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../../category_products/presentation/screens/category_products.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hideBackButton: false),
      body: Padding(
        padding: AppConstants.padding,
        child: BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit()..displayCategories(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shop by Categories', style: TextStyle(fontSize: 22)),
              SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height - 190,
                child: _categories(context), //
              ),
            ],
          ),
        ),
      ), //
    );
  }
}

Widget _categories(BuildContext context) {
  return BlocBuilder<CategoriesCubit, CategoriesState>(
    builder: (context, state) {
      if (state is CategoriesLoading) {
        return AppCommons.centerProgressIndicator;
      } //
      else if (state is CategoriesLoaded) {
        final categories = state.categories;
        return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: categories.length,
          separatorBuilder:
              (context, index) =>
                  const Divider(height: 10, color: Colors.transparent),
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () {
                  AppNavigator.push(
                    context,
                    widget: CategoryProductsScreen(
                      categoryEntity: categories[index],
                    ),
                  );
                },
                child: categoryRow(categories[index]),
              ),
        );
      } //
      else if (state is LoadCategoriesFailed) {
        AppCommons.showScaffold(context, message: state.errMsg);
      }
      return const SizedBox.shrink();
    },
  );
}
