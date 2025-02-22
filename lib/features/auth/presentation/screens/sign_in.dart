import 'package:flutter/material.dart';
import '../../../../common/app_commons.dart';
import '../../../../common/widgets/global_app_bar.dart';
import 'password_screen.dart';
import 'sign_up.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';
import '../../../../utils/helpers/app_navigator.dart';

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
