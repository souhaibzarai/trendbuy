import 'package:flutter/material.dart';

import '../../../utils/helpers/app_navigator.dart';
import '../../../utils/theme/app_colors.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    this.hideBackButton = false,
    this.actions,
    this.title,
    this.bgColor,
  });

  final Color? bgColor;
  final bool hideBackButton;
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(context) {
    return AppBar(
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      actions: [
        hideBackButton
            ? SizedBox.shrink()
            : IconButton(
              onPressed: () {
                AppNavigator.pop(context);
              },
              icon: Container(
                padding: const EdgeInsets.only(right: 3),
                width: 50,
                height: 50,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  color: AppColors.tertiaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
        const SizedBox(width: 10),
        title == null
            ? const SizedBox.shrink()
            : Text(
              title!,
              style: const TextStyle(color: AppColors.buttonBgColor),
            ),
        Spacer(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
