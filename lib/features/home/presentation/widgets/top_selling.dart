import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/common/widgets/custom_section.dart';
import 'package:trendbuy/features/products/presentation/bloc/products_cubit.dart';
import 'package:trendbuy/features/products/presentation/bloc/products_state.dart';
import 'package:trendbuy/features/products/presentation/widgets/top_selling_products.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopSellingProductsCubit>(
      create:
          (context) => TopSellingProductsCubit()..displayTopSellingProducts(),
      child: BlocBuilder<TopSellingProductsCubit, TopSellingProductsState>(
        buildWhen: (curr, prev) => curr != prev,
        builder: (context, state) {
          if (state is TopSellingProductsLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is TopSellingProductsLoaded) {
            return topSellingSection(
              context,
              state, //
            );
          } else if (state is LoadTopSellingProductsFailure) {
            AppCommons.showScaffold(context, message: state.error);
            return  Center(
              child: Text('Failed to load categories: ${state.error}'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

Widget topSellingSection(BuildContext context, TopSellingProductsLoaded state) {
  return CustomSection(
    sectionName: 'Top Selling',
    haveButton: false,
    widget: Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: TopSellingProducts(products: state.products),
    ),
  );
}
