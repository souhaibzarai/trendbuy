import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../../../../utils/theme/app_colors.dart';
import '../bloc/age_selector_cubit.dart';
import '../bloc/ages_display_cubit.dart';
import '../bloc/ages_display_state.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            width: .3,
            color: AppColors.tertiaryColor.withAlpha(150),
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is AgesLoadFailure) {
            String errMsg = state.errMsg;
            AppCommons.showScaffold(context, message: errMsg);
          }
          if (state is AgesLoaded) {
            return _ages(state.ages);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemCount: ages.length,
      separatorBuilder:
          (context, index) => const Divider(
            indent: 20,
            thickness: .2,
            height: 1,
            color: AppColors.tertiaryColor,
          ),
      itemBuilder: (context, index) {
        final textValue = ages[index].data()['value'];
        return GestureDetector(
          onTap: () {
            AppNavigator.pop(context);
            context.read<AgeSelectorCubit>().selectAge(textValue);
          },
          child: ListTile(
            leading: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppColors.tertiaryColor,
            ),
            title: Text(
              textValue,
              style: const TextStyle(
                color: AppColors.tertiaryColor, //
                fontSize: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
