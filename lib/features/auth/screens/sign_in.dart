import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/global_app_bar.dart';
import 'package:trendbuy/features/auth/screens/password_screen.dart';
import 'package:trendbuy/features/auth/screens/sign_up.dart';
import 'package:trendbuy/features/auth/widgets/custom_button.dart';
import 'package:trendbuy/features/auth/widgets/custom_header_text.dart';
import 'package:trendbuy/features/auth/widgets/custom_text_field.dart';
import 'package:trendbuy/features/auth/widgets/under_button_text.dart';
import 'package:trendbuy/utils/helpers/push_helpers.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeaderText(context, headerText: 'Sign In'),
            const SizedBox(height: 20),
            customTextField(context, hintText: 'Enter Email'),
            const SizedBox(height: 20),
            customButton(
              context,
              onPressed: () {
                PushHelpers.push(
                  context,
                  widget: const PasswordScreen(), //
                );
              },
            ),
            const SizedBox(height: 20, width: 20),
            underButtonText(
              context,
              text: 'Don\'t have an account? ',
              clickableText: 'Register',
              onTextClick: () {
                return PushHelpers.pushReplacement(
                  context,
                  widget: const SignUpScreen(), //
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
