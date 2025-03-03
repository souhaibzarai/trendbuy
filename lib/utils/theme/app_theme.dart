import 'package:flutter/material.dart';
import 'package:trendbuy/common/app_commons.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData theme = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.primaryColor,
    // hintColor: AppColors.infoColor,
    textTheme: const TextTheme(),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      constraints: const BoxConstraints(maxHeight: 80, maxWidth: 340),
      border: AppCommons.getOutlineInputBorder(),
      enabledBorder: AppCommons.getOutlineInputBorder(),
      errorBorder: AppCommons.getOutlineInputBorder(
        color: AppColors.errorColor,
      ),
      focusedBorder: AppCommons.getOutlineInputBorder(
        color: AppColors.successColor,
      ),
      fillColor: const Color.fromARGB(255, 22, 44, 74),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      hintStyle: getTextStyle(color: Colors.white38),
      errorStyle: getTextStyle(color: AppColors.errorColor),
    ),
  );
}

TextStyle getTextStyle({Color? color, double? fSize}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fSize ?? 14,
    fontWeight: FontWeight.w400,
  );
}

// OutlineInputBorder getOutlineInputBorder({Color? color}) {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(4),
//     borderSide: BorderSide(color: color ?? Colors.transparent),
//   );
// }
