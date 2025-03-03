import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/common/bloc/products/products_cubit.dart';
import 'package:trendbuy/common/bloc/products/products_state.dart';
import 'package:trendbuy/common/widgets/appbar/custom_app_bar.dart';
import 'package:trendbuy/features/products/domain/usecases/get_products_by_title.dart';
import 'package:trendbuy/features/search/presentation/widgets/search_field.dart';
import 'package:trendbuy/service_locator.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/constants/images_path.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

import '../../../../common/widgets/product/products_grid_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsDisplayCubit>(
      create:
          (context) => ProductsDisplayCubit(
            usecase: serviceLocator<GetProductsByTitleUseCase>(),
          ),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: CustomSearchField(), //
        ),
        body: Container(
          padding: AppConstants.padding,
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
              if (state is ProductsInitialState) {
                return const SizedBox.shrink();
              } //
              else if (state is ProductsLoading) {
                return AppCommons.centerProgressIndicator;
              } //
              else if (state is ProductsLoaded) {
                final products = state.products;
                return products.isEmpty
                    ? _notFound()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Products (${products.length})'),
                        SizedBox(height: 15),
                        ProductsGridList(products: state.products), //
                      ],
                    );
              } //
              else if (state is LoadProductsFailure) {
                AppCommons.showScaffold(context, message: state.error);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Center _notFound() => Center(
    child: Image.asset(
      ImagesPath.notFoundImg,
      color: AppColors.warningColor,
    ), //
  );
}
