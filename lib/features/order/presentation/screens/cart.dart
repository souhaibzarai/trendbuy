import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../cubit/cart_orders_cubit.dart';
import '../cubit/cart_orders_state.dart';
import '../widgets/ordered_product_item.dart';
import '../../../../utils/constants/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CartOrdersCubit()..getCartOrder(),
      child: Scaffold(
        appBar: CustomAppBar(), //
        body: BlocBuilder<CartOrdersCubit, CartOrdersState>(
          builder: (context, state) {
            if (state is CartOrdersLoading) {
              print('cart loading');
              AppCommons.centerProgressIndicator;
            } //
            else if (state is CartOrdersLoaded) {
              print('cart loaded');
              return Container(
                padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return OrderedProductItem(
                      ordersEntity: state.cartOrders[index],
                    );
                  },
                  separatorBuilder:
                      (context, index) =>
                          AppConstants.horizontalTransparentDivider,
                  itemCount: state.cartOrders.length,
                ),
              );
            } //
            else if (state is LoadCartOrdersFailed) {
              print('cart load failed');
              return Text(state.errMsg.toString());
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
