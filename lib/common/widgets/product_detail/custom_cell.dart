import 'package:flutter/material.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class CustomCell extends StatelessWidget {
  const CustomCell({
    super.key,
    required this.title,
    this.widget,
    this.color,
    this.isSelected = false,
  });

  final String title;
  final Widget? widget;
  final bool isSelected;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.tertiaryColor.withAlpha(100) //
                : null,
        borderRadius: const BorderRadius.all(AppConstants.border),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget == null ? 16 : 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              widget ?? const SizedBox.shrink(),
              SizedBox(width: 15),
              isSelected
                  ? Icon(
                    Icons.verified,
                    color: color ?? AppColors.buttonBgColor, //
                    size: 30,
                  )
                  : SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
