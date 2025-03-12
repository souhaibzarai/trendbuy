import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/cubit/button/button_state.dart';
import '../../../../common/cubit/button/button_state_cubit.dart';
import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../common/widgets/buttons/custom_reactive_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../home/presentation/screens/home.dart';
import '../../data/models/user_create.dart';
import '../../domain/use_cases/sign_up.dart';
import '../cubit/age_selector_cubit.dart';
import '../cubit/ages_display_cubit.dart';
import '../cubit/gender_selector_cubit.dart';
import '../widgets/age_selector.dart';
import '../widgets/gender_selector.dart';

class GenderAndAgeScreen extends StatelessWidget {
  const GenderAndAgeScreen({
    super.key,
    required this.userCreation, //
  });

  final UserCreation userCreation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectorCubit()),
          BlocProvider(create: (context) => AgeSelectorCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listenWhen: (curr, prev) => curr != prev,
          listener: (context, state) {
            if (state is ButtonFailureState) {
              AppCommons.showScaffold(
                context,
                message: state.errMsg, //
              );
            } else if (state is ButtonSuccessState) {
              AppCommons.showScaffold(
                context,
                message: 'Successfully Registered',
              );
              AppNavigator.pushAndRemove(context, widget: HomeScreen());
            }
          },
          child: Column(
            children: [
              Padding(
                padding: AppConstants.padding,
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
                        genderSelector(context, text: 'Male', index: 1),
                        const SizedBox(width: 10),
                        genderSelector(context, text: 'Female', index: 2),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.fillColor.withAlpha(25),
                      AppColors.fillColor.withAlpha(40),
                      AppColors.fillColor.withAlpha(80),
                      AppColors.fillColor.withAlpha(100),
                    ], //
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.symmetric(
                    vertical: BorderSide(
                      width: 1,
                      color: AppColors.tertiaryColor, //
                    ),
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    return CustomReactiveButton(
                      buttonText: 'Finish',
                      onPressed: () {
                        userCreation.gender =
                            context.read<GenderSelectorCubit>().selectedIndex;
                        userCreation.age =
                            context.read<AgeSelectorCubit>().selectedAge;
                        context.read<ButtonStateCubit>().execute(
                          useCase: SignUpUseCase(),
                          params: userCreation,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
