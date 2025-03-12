import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/theme/app_colors.dart';
import '../cubit/gender_selector_cubit.dart';

genderSelector(
  BuildContext context, {
  required String text,
  required int index,
}) {
  return BlocBuilder<GenderSelectorCubit, int>(
    key: ValueKey('$index$text'),
    builder: (context, state) {
      bool selectedCondition =
          index == context.read<GenderSelectorCubit>().selectedIndex;
      return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            context.read<GenderSelectorCubit>().selectIndex(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color:
                  selectedCondition
                      ? AppColors.tertiaryColor
                      : AppColors.fillColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: .5,
                color: AppColors.tertiaryColor, //
              ),
            ),
            width: double.infinity,
            child: Text(
              '${selectedCondition ? '➾ ' : ''}$text',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, // Added to center text
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
                color:
                    selectedCondition
                        ? AppColors.fillColor
                        : AppColors.tertiaryColor,
              ),
            ),
          ),
        ),
      );
    },
  );
}
