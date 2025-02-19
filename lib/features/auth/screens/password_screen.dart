import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/global_app_bar.dart';
import 'package:trendbuy/features/auth/widgets/custom_button.dart';
import 'package:trendbuy/features/auth/widgets/custom_header_text.dart';
import 'package:trendbuy/features/auth/widgets/custom_text_field.dart';
import 'package:trendbuy/features/auth/widgets/under_button_text.dart';
import 'package:trendbuy/utils/helpers/push_helpers.dart';

import 'package:trendbuy/features/auth/screens/forgot_password.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeaderText(context, headerText: 'Password'),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Enter password',
              isObscure: true,
            ),
            const SizedBox(height: 20),
            customButton(
              context,
              onPressed: () {},
              buttonText: 'Sign In', //
            ),
            const SizedBox(height: 20, width: 20),
            underButtonText(
              context,
              text: 'Forgot Passowrd? ',
              clickableText: 'Reset',
              onTextClick: () {
                return PushHelpers.push(
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
