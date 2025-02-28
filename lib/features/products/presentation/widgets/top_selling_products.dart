import 'package:flutter/material.dart';
import 'package:trendbuy/common/app_commons.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder:
          (context, index) => Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Constants.border),
                child:  Image.network(
                  products[index].images!.first,
                  height: 300,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: productDetails(products[index]), //
              ),
              Positioned(
                right: 10,
                top: 0,
                child:
                    AppCommons.getDiscountPrice(
                              price: products[index].price,
                              discountedPrice: products[index].discountedPrice,
                            ) ==
                            null
                        ? const SizedBox.shrink()
                        : Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Constants.border,
                              bottomRight: Constants.border,
                            ),
                            color: AppColors.fillColor.withAlpha(200),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Text(
                            AppCommons.getDiscountPrice(
                              price: products[index].price,
                              discountedPrice: products[index].discountedPrice,
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

  Container productDetails(ProductEntity product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.fillColor.withAlpha(200),
        borderRadius: const BorderRadius.only(
          bottomRight: Constants.border,
          bottomLeft: Constants.border,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
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
                product.gender == 1 ? 'Man' : 'Women',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: AppCommons.getProductPrice(
                    price: product.price,
                    discountedPrice: product.discountedPrice,
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.successColor,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: ' \$',
                      style:  TextStyle(
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
    );
  }
}
