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

  static String? getDiscountPercentage({
    required double price,
    required double discountedPrice,
  }) {
    if (discountedPrice == price || discountedPrice == 0) {
      return null;
    }
    final double result = 100 - ((discountedPrice / price) * 100);
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

  static Widget centerProgressIndicator = Center(
    child: CircularProgressIndicator.adaptive(), //
  );

  static OutlineInputBorder getOutlineInputBorder({
    Color? color,
    double? radiusSize,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusSize ?? 4),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    );
  }
}
