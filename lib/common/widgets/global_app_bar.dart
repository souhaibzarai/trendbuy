import 'package:flutter/material.dart';
import 'package:trendbuy/utils/helpers/push_helpers.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

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
  final Widget? title;

  @override
  Widget build(context) {
    return AppBar(
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      actions: actions,
      centerTitle: true,
      title: title ?? const Text(''),
      leading:
          hideBackButton
              ? null
              : IconButton(
                onPressed: () {
                  PushHelpers.pop(context);
                },
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
