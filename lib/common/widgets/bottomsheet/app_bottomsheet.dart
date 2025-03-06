import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class AppBottomsheet {
  AppBottomsheet._();

  static Future<void> display({
    required BuildContext context,
    required Widget widget,
  }) {
    return showModalBottomSheet(
      backgroundColor: AppColors.fillColor,
      isDismissible: true,
      showDragHandle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }
}
