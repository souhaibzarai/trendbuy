import 'package:flutter/material.dart';
import 'package:trendbuy/utils/theme/app_colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});


  @override
  Widget build(BuildContext context) {
  final focuNode = FocusNode();
    return SearchBar(
      focusNode: focuNode,
      backgroundColor: WidgetStatePropertyAll(AppColors.fillColor),
      elevation: WidgetStatePropertyAll(6),
      leading: Icon(
        Icons.search,
        color: AppColors.tertiaryColor, //
        size: 30,
      ),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
      onTapOutside: (event) {
        focuNode.unfocus();
      },

      hintText: 'Search',
      hintStyle: WidgetStatePropertyAll(
        TextStyle(color: AppColors.whiteColor), //
      ),
      textInputAction: TextInputAction.search,
    );
  }
}
