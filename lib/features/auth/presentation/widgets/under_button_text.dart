import 'package:flutter/material.dart';

Widget underButtonText(
  BuildContext context, {
  required String text,
  required String clickableText,
  required VoidCallback? onTextClick,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$text ',
        style: const TextStyle(
          fontSize: 13, //
          color: Colors.white,
        ),
      ), //
      GestureDetector(
        onTap: onTextClick,
        child: Text(
          clickableText,
          style: const TextStyle(
            inherit: true,
            // color: AppColors.tertiaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ], //
  );
}
