import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

Widget basicAppButton({required Widget content, required VoidCallback onPressed}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      enableFeedback: false,
      backgroundColor: AppColors.tertiaryColor,
      fixedSize: const Size(340, 50),
      alignment: AlignmentDirectional.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), //
      ),
    ),
    child: content,
  );
}
