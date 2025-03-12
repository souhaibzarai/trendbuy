import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/features/products/presentation/bloc/product_size_cubit.dart';
import 'package:trendbuy/features/products/presentation/widgets/product_sizes.dart';
import 'custom_product_detail_row.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({super.key, required ProductEntity product})
    : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return CustomProductDetailRow(
      onPressed: () {
        AppBottomsheet.display(
          isSmall: true,
          context: context,
          widget: BlocProvider.value(
            value: BlocProvider.of<ProductSizeCubit>(context),
            child: ProductSizes(product: _product),
          ),
        );
      },
      title: 'Size',
      child: Row(
        children: [
          BlocBuilder<ProductSizeCubit, int>(
            builder:
                (context, state) => Text(
                  _product.sizes[state],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500, //
                  ),
                ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 30,
          ), //
        ],
      ),
    );
  }
}
