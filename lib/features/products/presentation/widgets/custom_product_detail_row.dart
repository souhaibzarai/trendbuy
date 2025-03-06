import 'package:flutter/material.dart';
import '../../../../utils/theme/app_colors.dart';

class CustomProductDetailRow extends StatelessWidget {
  const CustomProductDetailRow({
    super.key,
    required this.child,
    required this.title,
    this.onPressed,
  });

  final Widget child;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: AppColors.fillColor,
        ),
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(title, style: const TextStyle(fontSize: 16)), child],
        ),
      ),
    );
  }
}
