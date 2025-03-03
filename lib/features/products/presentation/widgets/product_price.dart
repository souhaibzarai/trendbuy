import 'package:flutter/material.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required ProductEntity product})
    : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${AppCommons.getProductPrice(price: _product.price, discountedPrice: _product.discountedPrice)}',
      style: TextStyle(
        fontWeight: FontWeight.bold, //
        color: AppColors.whiteColor,
        fontSize: 14,
      ),
    );
  }
}
