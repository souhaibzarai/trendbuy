import 'package:flutter/material.dart';
import '../../../search/presentation/screens/search.dart';
import '../../../search/presentation/widgets/search_field.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, widget: const SearchScreen());
      },
      child: const CustomSearchField(isEnabled: false),
    );
  }
}
