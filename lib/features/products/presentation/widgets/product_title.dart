import 'package:flutter/material.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required ProductEntity product,
  }) : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return Text(
      _product.title,
      style: TextStyle(
        fontWeight: FontWeight.bold, //
        fontSize: 16,
      ),
    );
  }
}
