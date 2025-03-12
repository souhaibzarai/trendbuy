import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/products/products_cubit.dart';
import '../../../../common/cubit/products/products_state.dart';
import '../../../../common/widgets/custom_section.dart';
import '../../../../common/widgets/product/custom_products_list.dart';
import '../../../../service_locator.dart';
import '../../../products/domain/usecases/get_top_selling.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsDisplayCubit>(
      create:
          (context) => ProductsDisplayCubit(
            usecase: serviceLocator<GetTopSellingUseCase>(),
          )..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        buildWhen: (curr, prev) => curr != prev,
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } //
          else if (state is ProductsLoaded) {
            return CustomSection(
              sectionName: 'Top Selling',
              haveButton: false,
              widget: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: CustomProductsList(products: state.products),
              ),
            );
          } //
          else if (state is LoadProductsFailure) {
            AppCommons.showScaffold(context, message: state.error);
            return Center(
              child: Text('Failed to load categories: ${state.error}'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
