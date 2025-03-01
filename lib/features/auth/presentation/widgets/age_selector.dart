import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/bottomsheet/app_bottomsheet.dart';
import '../../../../utils/theme/app_colors.dart';
import '../bloc/age_selector_cubit.dart';
import '../bloc/ages_display_cubit.dart';
import 'ages.dart';

Widget ageSelector(BuildContext context) {
  return BlocBuilder<AgeSelectorCubit, String>(
    builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomsheet.display(
            context: context,
            widget: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<AgeSelectorCubit>()),
                BlocProvider.value(
                  value: context.read<AgesDisplayCubit>()..displayAges(),
                ),
              ],
              child: const Ages(),
            ), //
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.fillColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .5, color: AppColors.tertiaryColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          // height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.read<AgeSelectorCubit>().selectedAge,
                style: TextStyle(
                  color: AppColors.tertiaryColor,
                  fontSize: 14, //
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 18, //
                color: AppColors.whiteColor,
              ),
            ],
          ), //
        ),
      );
    },
  );
}
