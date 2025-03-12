import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/common/cubit/products/products_cubit.dart';
import 'package:trendbuy/common/cubit/products/products_state.dart';
import 'package:trendbuy/common/widgets/appbar/custom_app_bar.dart';
import 'package:trendbuy/features/order/domain/usecases/get_cart_orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductsDisplayCubit(usecase: GetCartOrdersUseCase()),
      child: Scaffold(
        appBar: CustomAppBar(), //
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              AppCommons.centerProgressIndicator;
            } //
            else if (state is ProductsLoaded) {
              return Text(state.products.length.toString());
            } //
            else if (state is LoadProductsFailure) {
              return Text(state.error.toString());
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
