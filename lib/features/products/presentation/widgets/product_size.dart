import 'package:flutter/material.dart';
import 'package:trendbuy/features/products/presentation/widgets/custom_product_detail_row.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomProductDetailRow(
      title: 'Size',
      child: Row(
        children: [
          const Text(
            'S',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500, //
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
