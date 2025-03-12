import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/widgets/bottomsheet/custom_app_bottomsheet_header.dart';
import 'package:trendbuy/common/widgets/product_detail/custom_cell.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/features/products/presentation/cubit/product_color_cubit.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/helpers/navigator/app_navigator.dart';
import 'package:trendbuy/utils/helpers/product/product_color_helper.dart';

class ProductColors extends StatelessWidget {
  const ProductColors(this._product, {super.key});

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return CustomAppBottomSheetHeader(
      title: 'Color',
      body: Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final color = ProductColorHelper.getProductColorUsingIndex(
              _product,
              index,
            );
            return GestureDetector(
              onTap: () {
                AppNavigator.pop(context);
                context.read<ProductColorCubit>().selectColor(index);
              },
              child: CustomCell(
                title: _product.colors[index].title,
                color: color,
                isSelected:
                    index ==
                    context.read<ProductColorCubit>().selectedColorIndex,
                widget: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
          separatorBuilder:
              (context, index) => AppConstants.horizontalTransparentDivider,
          itemCount: _product.colors.length,
        ),
      ),
    );
  }
}
