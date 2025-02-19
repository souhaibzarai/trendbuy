import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

Widget underButtonText(
  BuildContext context, {
  required String text,
  required String clickableText,
  required VoidCallback? onTextClick,
}) {
  return Text.rich(
    TextSpan(
      text: text,
      style: const TextStyle(
        fontSize: 13, //
        color: Colors.white,
      ),
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onTextClick,
          text: clickableText,
          style: const TextStyle(
            inherit: true,
            color: AppColors.buttonBgColor,
            fontWeight: FontWeight.w500,
          ), //
        ), //
      ], //
    ),
  );
}
