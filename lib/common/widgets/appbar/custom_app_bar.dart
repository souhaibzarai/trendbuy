import 'package:flutter/material.dart';

import '../../../utils/helpers/app_navigator.dart';
import '../../../utils/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.hideBackButton = false,
    this.actions,
    this.title,
    this.bgColor,
  });

  final Color? bgColor;
  final bool hideBackButton;
  final List<Widget>? actions;
  final Widget? title;

  @override
  Widget build(context) {
    return AppBar(
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      title: title,
      leading:
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
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
