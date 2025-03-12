import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/product/products_grid_list.dart';
import '../../../category/domain/entities/category.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/products/products_cubit.dart';
import '../../../../common/cubit/products/products_state.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../utils/constants/constants.dart';
import '../../../products/domain/usecases/get_products_by_category_id.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hideBackButton: false),
      body: Padding(
        padding: AppConstants.padding,
        child: BlocProvider<ProductsDisplayCubit>(
          create:
              (context) => ProductsDisplayCubit(
                usecase: GetProductsByCategoryIdUseCase(),
              )..displayProducts(params: categoryEntity.categoryId),
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return AppCommons.centerProgressIndicator;
              } else if (state is ProductsLoaded) {
                final products = state.products;
                // if (products.isEmpty) {
                //   return Center(child: Text('No items found'));
                // }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${categoryEntity.title} (${products.length})'),
                    SizedBox(height: 15),
                    ProductsGridList(products: products),
                  ],
                );
              } else if (state is LoadProductsFailure) {
                AppCommons.showScaffold(context, message: state.error);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
