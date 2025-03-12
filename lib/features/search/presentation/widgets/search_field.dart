import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/cubit/products/products_cubit.dart';

import '../../../../utils/theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.isEnabled = true, //
  });

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<ProductsDisplayCubit>().displayInitial();
        } else {
          context.read<ProductsDisplayCubit>().displayProducts(params: value);
        }
      },
      decoration: InputDecoration(
        border: AppCommons.getOutlineInputBorder(radiusSize: 25),
        enabledBorder: AppCommons.getOutlineInputBorder(radiusSize: 25),
        focusedBorder: AppCommons.getOutlineInputBorder(
          color: AppColors.successColor,
          radiusSize: 25,
        ),
        errorBorder: AppCommons.getOutlineInputBorder(
          color: AppColors.errorColor,
          radiusSize: 25,
        ),
        disabledBorder: AppCommons.getOutlineInputBorder(radiusSize: 25),
        enabled: isEnabled,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.tertiaryColor, //
          size: 25,
        ),
        hintText: 'Search',
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
