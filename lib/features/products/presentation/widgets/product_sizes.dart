import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/bottomsheet/custom_app_bottomsheet_header.dart';
import '../../../../common/widgets/product_detail/custom_cell.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../domain/entities/product.dart';
import '../cubit/product_size_cubit.dart';

class ProductSizes extends StatelessWidget {
  const ProductSizes({super.key, required ProductEntity product})
    : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return CustomAppBottomSheetHeader(
      title: 'Size',
      body: Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                AppNavigator.pop(context);
                context.read<ProductSizeCubit>().selectSize(index);
              },
              child: CustomCell(
                title: _product.sizes[index],
                isSelected:
                    context.read<ProductSizeCubit>().selectedSizeIndex == index,
              ),
            );
          },
          separatorBuilder:
              (context, index) => AppConstants.horizontalTransparentDivider,
          itemCount: _product.sizes.length,
        ),
      ),
    );
  }
}
