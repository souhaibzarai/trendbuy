import 'package:flutter/material.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

Widget customButton(
  BuildContext context, {
  String? buttonText,
  required VoidCallback onPressed,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      enableFeedback: false,
      backgroundColor: AppColors.buttonBgColor,
      foregroundColor: Colors.white,
      fixedSize: const Size(340, 50),
      alignment: AlignmentDirectional.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    child: Text(
      buttonText ?? 'Continue',
      style: const TextStyle(color: Colors.white),
    ),
  );
}
