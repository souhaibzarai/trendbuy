import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:trendbuy/features/products/presentation/widgets/product_colors.dart';
import 'custom_product_detail_row.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProductDetailRow(
      onPressed: () {
        AppBottomsheet.display(
          context: context,
          widget: const ProductColors(),
        );
      },
      title: 'Color',
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            width: 25,
            height: 25,
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
