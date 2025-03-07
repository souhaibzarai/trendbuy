import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendbuy/common/widgets/product_detail/custom_cell.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/features/products/presentation/bloc/product_color_cubit.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/helpers/navigator/app_navigator.dart';
import 'package:trendbuy/utils/helpers/product/product_color_helper.dart';

class ProductColors extends StatelessWidget {
  const ProductColors(this._product, {super.key});

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Color',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      AppNavigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 22),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppNavigator.pop(context);
                    context.read<ProductColorCubit>().selectColor(index);
                  },
                  child: colorCell(
                    title: _product.colors[index].title,
                    color: ProductColorHelper.getProductColorUsingIndex(
                      _product,
                      index,
                    ),
                    isSelected:
                        index ==
                        context.read<ProductColorCubit>().selectedColorIndex,
                  ),
                );
              },
              separatorBuilder:
                  (context, index) => AppConstants.horizontalTransparentDivider,
              itemCount: _product.colors.length,
            ),
          ),
        ],
      ),
    );
  }
}

Widget colorCell({
  required String title,
  required Color color,
  bool isSelected = false,
}) {
  return CustomCell(
    title: title,
    isSelected: isSelected,
    color: color,
    widget: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: color, //
        shape: BoxShape.circle,
      ),
    ),
  );
}
