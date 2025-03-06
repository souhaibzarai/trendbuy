import '../../../features/products/domain/entities/product.dart';

class ProductPriceHelpers {
  static String? getDiscountPercentage({required ProductEntity product}) {
    if (product.discountedPrice == product.price ||
        product.discountedPrice == 0) {
      return null;
    }
    final double result =
        100 - ((product.discountedPrice / product.price) * 100);
    return '${result.round()}%';
  }

  static double getProductPrice({required ProductEntity product}) {
    return (product.discountedPrice == product.price ||
            product.discountedPrice == 0)
        ? product.price
        : product.discountedPrice;
  }
}
