import 'package:flutter/material.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

genderSelector(
  BuildContext context, {
  required String text,
  required int index,
}) {
  return Expanded(
    flex: 1,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: index == 1 ? AppColors.infoColor : AppColors.fillColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: AppColors.infoColor, //
          ),
        ),
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center, // Added to center text
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.normal,
            color: index == 1 ? AppColors.fillColor : AppColors.infoColor,
          ),
        ),
      ),
    ),
  );
}
