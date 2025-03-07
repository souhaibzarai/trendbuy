import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class AppBottomsheet {
  AppBottomsheet._();

  static Future<void> display({
    required BuildContext context,
    required Widget widget,
    bool isSmall = false,
  }) {
    return showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight:
            isSmall
                ? MediaQuery.of(context).size.height / 2.3
                : MediaQuery.of(context).size.height / 2,
      ),
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
