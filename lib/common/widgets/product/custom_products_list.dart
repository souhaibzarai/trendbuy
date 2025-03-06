import 'package:flutter/material.dart';

import '../../../features/products/domain/entities/product.dart';
import 'product_card.dart';

class CustomProductsList extends StatelessWidget {
  const CustomProductsList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    );
  }
}
