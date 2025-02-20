import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/app_commons.dart';
import 'package:trendbuy/common/widgets/global_app_bar.dart';
import 'package:trendbuy/features/auth/presentation/screens/password_screen.dart';
import 'package:trendbuy/features/auth/presentation/screens/sign_up.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_button.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_header_text.dart';
import 'package:trendbuy/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:trendbuy/features/auth/presentation/widgets/under_button_text.dart';
import 'package:trendbuy/utils/helpers/app_navigator.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customHeaderText(context, headerText: 'Sign In'),
            const SizedBox(height: 20),
            customTextField(context, hintText: 'Email'),
            const SizedBox(height: 20),
            customButton(
              context,
              onPressed: () {
                AppNavigator.push(
                  context,
                  widget: const PasswordScreen(), //
                );
              },
            ),
            const SizedBox(height: 10),
            underButtonText(
              context,
              text: 'Don\'t have an account?',
              clickableText: 'Register',
              onTextClick: () {
                return AppNavigator.push(
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
