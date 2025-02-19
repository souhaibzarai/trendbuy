import 'package:flutter/material.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

Widget customTextField(
  BuildContext context, {
  String? hintText,
  bool? isObscure = false,
}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,

      helper: const Text('', style: null),
    ),
    cursorColor: AppColors.buttonBgColor,
    obscureText: isObscure!,
  );
}
