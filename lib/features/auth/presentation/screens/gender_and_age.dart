import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/age_selector_cubit.dart';
import '../bloc/ages_display_cubit.dart';
import '../bloc/gender_selector_cubit.dart';
import '../widgets/age_selector.dart';
import '../widgets/gender_selector.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/widgets/global_app_bar.dart';
import '../../../../utils/theme/app_colors.dart';

class GenderAndAgeScreen extends StatelessWidget {
  const GenderAndAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectorCubit()),
          BlocProvider(create: (context) => AgeSelectorCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
        ],
        child: Column(
          children: [
            Padding(
              padding: AppCommons.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tell us about yourself', //
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  // Gender Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      genderSelector(context, text: "Male", index: 1),
                      const SizedBox(width: 10),
                      genderSelector(context, text: "Female", index: 2),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'How old are you?', //
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ageSelector(context),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              height: 100,
              width: double.infinity,
              color: AppColors.fillColor.withAlpha(80),
              // decoration: BoxDecoration(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tertiaryColor,
                  foregroundColor: AppColors.fillColor,
                ),
                onPressed: () {},
                child: Text('Finish'), //
              ),
            ),
          ],
        ),
      ),
    );
  }
}
