import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/bottomsheet/app_bottomsheet.dart';
import '../../domain/entities/product.dart';
import 'product_colors.dart';
import '../../../../utils/helpers/product/product_color_helper.dart';
import '../cubit/product_color_cubit.dart';
import 'custom_product_detail_row.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({super.key, required ProductEntity productEntity})
    : _product = productEntity;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return CustomProductDetailRow(
      onPressed: () {
        AppBottomsheet.display(
          isSmall: true,
          context: context,
          widget: BlocProvider.value(
            value: BlocProvider.of<ProductColorCubit>(context),
            child: ProductColors(_product),
          ),
        );
      },
      title: 'Color',
      child: Row(
        children: [
          BlocBuilder<ProductColorCubit, int>(
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: ProductColorHelper.getProductColorUsingIndex(
                    _product,
                    state,
                  ),
                  shape: BoxShape.circle,
                ),
                width: 25,
                height: 25,
              );
            },
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
