import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/bloc/products/products_cubit.dart';
import '../../../../common/bloc/products/products_state.dart';
import '../../../../common/widgets/custom_section.dart';
import '../../../../common/widgets/product/custom_products_list.dart';
import '../../../../service_locator.dart';
import '../../../products/domain/usecases/get_new_in.dart';

class NewInProducts extends StatelessWidget {
  const NewInProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsDisplayCubit>(
      create:
          (context) =>
              ProductsDisplayCubit(usecase: serviceLocator<GetNewInUseCase>())
                ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } //
          else if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return const SizedBox.shrink();
            }
            return CustomSection(
              sectionName: 'New In',
              haveButton: false,
              widget: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: CustomProductsList(
                  products: state.products, //
                ),
              ),
            );
          } //
          else if (state is LoadProductsFailure) {
            AppCommons.showScaffold(context, message: state.error);
            return Center(
              child: Text(
                'Failed to load categories: ${state.error}',
                style: const TextStyle(fontSize: 10),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
