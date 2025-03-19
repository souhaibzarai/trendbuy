import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppConstants {
  AppConstants._();

  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  );
  static const border = Radius.circular(15);

  static const horizontalTransparentDivider = Divider(
    height: 10,
    color: Colors.transparent,
  );
  static const verticalTransparentDivider = VerticalDivider(
    width: 30,
    color: Colors.transparent,
  );

  static const horizontalDivider = Divider(
    indent: 20,
    thickness: .2,
    height: 1,
    color: AppColors.tertiaryColor,
  );

  static const verticalDivider = VerticalDivider(
    indent: 20,
    thickness: .2,
    width: 1,
    color: AppColors.tertiaryColor,
  );
}
