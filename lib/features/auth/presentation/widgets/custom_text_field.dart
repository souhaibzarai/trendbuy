import 'package:flutter/material.dart';
import '../../../../utils/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isObscure = false,
    this.isReadOnly = true, //
  });

  final String hintText;
  final bool isObscure;
  final TextEditingController? controller;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      cursorColor: AppColors.buttonBgColor,
      obscureText: isObscure,
      controller: controller,
      enabled: isReadOnly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a valid ${hintText.toLowerCase()}';
        }
        if (isObscure && value.length < 9) {
          return 'Weak ${hintText.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
