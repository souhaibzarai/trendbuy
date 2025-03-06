import 'package:flutter/material.dart';

import '../../../utils/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.content,
  });

  final VoidCallback onPressed;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        enableFeedback: false,
        backgroundColor: AppColors.tertiaryColor,
        fixedSize: const Size(340, 70),
        alignment: AlignmentDirectional.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), //
        ),
      ),
      child: content,
    );
  }
}
