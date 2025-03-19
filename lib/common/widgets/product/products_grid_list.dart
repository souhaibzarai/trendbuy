import 'package:flutter/material.dart';

import '../../../features/products/domain/entities/product.dart';
import 'product_card.dart';

class ProductsGridList extends StatelessWidget {
  const ProductsGridList({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final currentProduct = products[index];
          return ProductCard(product: currentProduct);
        },
      ),
    );
  }
}
