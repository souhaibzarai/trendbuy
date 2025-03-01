import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/features/category/domain/entities/category.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/bloc/products/products_cubit.dart';
import '../../../../common/bloc/products/products_state.dart';
import '../../../../common/widgets/appbar/global_app_bar.dart';
import '../../../../common/widgets/product/product_card.dart';
import '../../../../utils/constants/constants.dart';
import '../../../products/domain/usecases/get_products_by_category_id.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(hideBackButton: false, title: categoryEntity.title),
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
                return Column(
                  children: [
                    Text('${categoryEntity.title} (${products.length})'),
                    SizedBox(height: 15),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final currentProduct = products[index];
                        return ProductCard(productEntity: currentProduct);
                      },
                    ),
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
