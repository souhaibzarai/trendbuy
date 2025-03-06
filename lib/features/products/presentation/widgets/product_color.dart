import 'package:flutter/material.dart';
import 'custom_product_detail_row.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProductDetailRow(
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
          ), //
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
