import 'package:flutter/material.dart';
import '../../../../utils/helpers/product/product_price_helpers.dart';
import '../../domain/entities/product.dart';
import '../../../../utils/theme/app_colors.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, required ProductEntity product})
    : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${ProductPriceHelpers.getProductPrice(product: _product)}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.tertiaryColor,
        fontSize: 14,
      ),
    );
  }
}
