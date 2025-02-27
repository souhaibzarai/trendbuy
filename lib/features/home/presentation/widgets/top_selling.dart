import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
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
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is TopSellingProductsLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 300, //
                  ),
                  child: TopSellingProducts(products: state.products),
                ),
              ],
            );
          } else if (state is LoadTopSellingProductsFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppCommons.showScaffold(context, message: state.error);
            });
            return Center(
              child: Text('Failed to load categories: ${state.error}'),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
