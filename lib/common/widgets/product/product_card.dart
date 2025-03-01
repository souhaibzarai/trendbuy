import 'package:flutter/material.dart';
import '../../app_commons.dart';
import '../../../features/products/domain/entities/product.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(AppConstants.border),
          child: Image.network(
            productEntity.images!.first,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productEntity.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productEntity.gender == 1 ? 'Man' : 'Women',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: AppCommons.getProductPrice(
                          price: productEntity.price,
                          discountedPrice: productEntity.discountedPrice,
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.successColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: ' \$',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.successColor.withAlpha(180), //
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ), //
        ),
        Positioned(
          right: 10,
          top: 0,
          child:
              AppCommons.getDiscountPrice(
                        price: productEntity.price,
                        discountedPrice: productEntity.discountedPrice,
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
                      AppCommons.getDiscountPrice(
                        price: productEntity.price,
                        discountedPrice: productEntity.discountedPrice,
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
    );
  }
}
