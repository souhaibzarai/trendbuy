import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';
import '../../../../common/widgets/appbar/global_app_bar.dart';
import '../../../../common/widgets/buttons/custom_reactive_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../../domain/use_cases/reset_password.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import 'reset_sent_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({
    super.key,
    required this.email, //
  });

  final String email;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailContoller = TextEditingController(
      text: email,
    );
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
        child: Center(
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
                  AppCommons.showScaffold(context, message: 'Email Reset Sent');
                }
              },
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customHeaderText(context, headerText: 'Reset Password'),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailContoller,
                    ),
                    const SizedBox(height: 20),
                    Builder(
                      builder: (context) {
                        return CustomReactiveButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final email = emailContoller.text;
                              context.read<ButtonStateCubit>().execute(
                                useCase: ResetPasswordUsecase(),
                                params: email,
                              );
                              AppNavigator.pushReplacement(
                                context,
                                widget: const ResetSentScreen(),
                              );
                              formKey.currentState!.save();
                            }
                          },
                          buttonText: 'Reset Password',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
