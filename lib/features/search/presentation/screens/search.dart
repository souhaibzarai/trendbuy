import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/cubit/products/products_cubit.dart';
import '../../../../common/cubit/products/products_state.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../products/domain/usecases/get_products_by_title.dart';
import '../widgets/search_field.dart';
import '../../../../service_locator.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/theme/app_colors.dart';

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
