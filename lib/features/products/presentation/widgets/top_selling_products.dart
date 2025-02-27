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
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemBuilder:
          (context, index) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Constants.border),
                child: Image.network(
                  products[index].images!.first,
                  height: 300,
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
                        ? SizedBox.shrink()
                        : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Constants.border,
                              bottomRight: Constants.border,
                            ),
                            color: AppColors.fillColor.withAlpha(200),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Text(
                            AppCommons.getDiscountPrice(
                              price: products[index].price,
                              discountedPrice: products[index].discountedPrice,
                            )!,
                            style: TextStyle(
                              color: AppColors.successColor,
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.fillColor.withAlpha(200),
        borderRadius: BorderRadius.only(
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
                style: TextStyle(
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.whiteColor.withAlpha(255),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.discountedPrice == 1 ? 'Men' : 'Women',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: AppCommons.getProductPrice(
                    price: product.price,
                    discountedPrice: product.discountedPrice,
                  ),
                  children: [
                    TextSpan(
                      text: ' MAD',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColors.successColor.withAlpha(180), //
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
