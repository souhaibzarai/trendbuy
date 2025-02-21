import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/global_app_bar.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_button.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_header_text.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:trendbuy/features/auth/presentation/widgets/under_button_text.dart';
import 'package:trendbuy/utils/helpers/app_navigator.dart';

import 'package:trendbuy/features/auth/presentation/screens/forgot_password.dart';
import '../../../../common/widgets/app_commons.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customHeaderText(context, headerText: 'Password'),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Password',
              isObscure: true, //
            ),
            const SizedBox(height: 20),
            customButton(
              context,
              onPressed: () {},
              buttonText: 'Sign In', //
            ),
            const SizedBox(height: 10),
            underButtonText(
              context,
              text: 'Forgot Passowrd?',
              clickableText: 'Reset',
              onTextClick: () {
                return AppNavigator.push(
                  context,
                  widget: const ForgotPasswordScreen(), //
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
