import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../order/data/models/add_to_cart.dart';
import '../../../order/domain/usecases/add_to_cart.dart';
import '../../../order/presentation/screens/cart.dart';
import '../../domain/entities/product.dart';
import '../cubit/product_color_cubit.dart';
import '../cubit/product_quantity_cubit.dart';
import '../cubit/product_size_cubit.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../../../utils/helpers/product/product_price_helpers.dart';
import '../../../../utils/theme/app_colors.dart';

import '../../../../common/widgets/buttons/basic_reactive_app_button.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listenWhen: (curr, prev) => curr != prev,
      listener: (context, state) {
        if (state is ButtonFailureState) {
          AppCommons.showScaffold(context, message: state.errMsg);
        } //
        else if (state is ButtonSuccessState) {
          AppNavigator.push(
            context,
            widget: const CartScreen(), //
          );
        }
      },

      child: Container(
        decoration: BoxDecoration(color: AppColors.buttonBgColor.withAlpha(10)),
        height: 70,
        child: BasicReactiveAppButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              useCase: AddToCartUseCase(),
              params: AddToCartModel(
                productId: product.productId,
                productTitle: product.title,
                productColor:
                    product
                        .colors[context
                            .read<ProductColorCubit>()
                            .selectedColorIndex]
                        .title,
                productSize:
                    product.sizes[context
                        .read<ProductSizeCubit>()
                        .selectedSizeIndex],
                productQuantity: context.read<ProductQuantityCubit>().state,
                productPrice: ProductPriceHelpers.getProductPrice(
                  product: product,
                ),
                totalPrice:
                    ProductPriceHelpers.getProductPrice(product: product) *
                    context.read<ProductQuantityCubit>().state,
                productImageUrl: product.images![0],
                createdAt: DateTime.now().toString(),
              ),
            );
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  final double price =
                      ProductPriceHelpers.getProductPrice(product: product) *
                      state;
                  return Text(
                    '\$${price.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  );
                },
              ), //
              Text(
                'Add To Bag',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ), //
        ),
      ),
    );
  }
}
