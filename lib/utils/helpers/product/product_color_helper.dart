import 'package:flutter/cupertino.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';

class ProductColorHelper {
 static Color getProductColorUsingIndex(ProductEntity product, int index) {
    return Color.fromARGB(
      255,
      int.parse(product.colors[index].rgb[0]),
      int.parse(product.colors[index].rgb[1]),
      int.parse(product.colors[index].rgb[2]),
    );
  }
}
