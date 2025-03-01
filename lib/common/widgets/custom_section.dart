import 'package:flutter/material.dart';
import '../../utils/theme/app_colors.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.sectionName,
    required this.widget,
    this.haveButton = false,
    this.buttonText,
    this.onTap,
    this.color,
    this.size,
  });

  final Widget widget;
  final bool? haveButton;
  final String? buttonText;
  final String sectionName;
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionName,
              style: TextStyle(
                fontSize: size ?? 16,
                fontWeight: FontWeight.w500,
                color: color ?? Colors.white,
              ),
            ),
            haveButton! == true
                ? GestureDetector(
                  onTap: onTap,
                  child: Text(
                    buttonText ?? 'more details',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ), //
                )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 15),
        widget,
      ],
    );
  }
}
