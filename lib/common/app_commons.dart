import 'package:flutter/material.dart';

class AppCommons {
  const AppCommons._();

  static void showScaffold(BuildContext context, {required String message}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (message == '') {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
    });
  }

  static String? getDiscountPrice({
    required double price,
    required double discountedPrice,
  }) {
    if (discountedPrice == price || discountedPrice == 0) {
      return null;
    }
    final double result = ((discountedPrice / price) * 100);
    return '${result.round()}%';
  }

  static String getProductPrice({
    required double price,
    required double? discountedPrice,
  }) {
    if (discountedPrice == null) {
      return '$price';
    }
    return '$discountedPrice';
  }
}
