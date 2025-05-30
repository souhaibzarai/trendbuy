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
import '../../data/models/user_sign_in.dart';
import '../../domain/use_cases/sign_in.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';
import 'forgot_password.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({
    super.key,
    required this.userSignIn, //
  });

  final UserSignIn userSignIn;

  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
        child: BlocProvider<ButtonStateCubit>(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listenWhen: (prev, curr) => prev != curr,
            listener: (context, state) {
              if (state is ButtonFailureState) {
                AppCommons.showScaffold(
                  context,
                  message: state.errMsg, //
                );
              } else if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  widget: const HomeScreen(), //
                );
              }
            },
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customHeaderText(context, headerText: 'Password'),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 20,
                          color: AppColors.fillColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            userSignIn.email!,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.fillColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Password',
                    isObscure: true, //
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return CustomReactiveButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            userSignIn.password = passwordController.text;
                            context.read<ButtonStateCubit>().execute(
                              useCase: SignInUsecase(),
                              params: userSignIn,
                            );
                            formKey.currentState!.save();
                          }
                        },
                        buttonText: 'Sign In', //
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  underButtonText(
                    context,
                    text: 'Forgot Passowrd?',
                    clickableText: 'Reset',
                    onTextClick: () {
                      return AppNavigator.push(
                        context,
                        widget: ForgotPasswordScreen(
                          email: userSignIn.email!, //
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
