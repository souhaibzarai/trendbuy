import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/widgets/buttons/basic_app_button.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/features/products/presentation/bloc/product_quantity_cubit.dart';
import 'package:trendbuy/utils/helpers/product/product_price_helpers.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class AddToBag extends StatelessWidget {
  const AddToBag({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.buttonBgColor.withAlpha(10)),
      height: 70,
      child: BasicAppButton(
        onPressed: () {},
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
    );
  }
}
