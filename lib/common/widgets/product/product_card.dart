import 'package:flutter/material.dart';
import 'package:trendbuy/features/products/presentation/screens/product_details.dart';
import 'package:trendbuy/utils/helpers/app_navigator.dart';
import '../../app_commons.dart';
import '../../../features/products/domain/entities/product.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          widget: ProductDetailsScreen(productEntity: product),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(AppConstants.border),
            child: Image.network(
              product.images!.first,
              height: 300,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.fillColor.withAlpha(200),
                borderRadius: const BorderRadius.only(
                  bottomRight: AppConstants.border,
                  bottomLeft: AppConstants.border,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          '${AppCommons.getProductPrice(price: product.price, discountedPrice: product.discountedPrice)}\$  ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.successColor,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text:
                              (product.price == product.discountedPrice ||
                                      product.discountedPrice == 0)
                                  ? ''
                                  : '${product.price.toString()}\$',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor, //
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.wavy,
                            decorationThickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //
          ),
          Positioned(
            right: 10,
            top: 0,
            child:
                AppCommons.getDiscountPercentage(
                          price: product.price,
                          discountedPrice: product.discountedPrice,
                        ) ==
                        null
                    ? const SizedBox.shrink()
                    : Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: AppConstants.border,
                          bottomRight: AppConstants.border,
                        ),
                        color: AppColors.fillColor.withAlpha(200),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: Text(
                        AppCommons.getDiscountPercentage(
                          price: product.price,
                          discountedPrice: product.discountedPrice,
                        )!,
                        style: const TextStyle(
                          color: AppColors.warningColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
