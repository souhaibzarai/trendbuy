import 'package:flutter/material.dart';
import 'package:trendbuy/features/auth/screens/sign_in.dart';

import '../../../common/widgets/global_app_bar.dart';
import '../../../utils/helpers/push_helpers.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customHeaderText(context, headerText: 'Sign Up'),
            const SizedBox(height: 20),
            customTextField(context, hintText: 'Enter Email'),
            customTextField(
              context,
              hintText: 'Enter Password',
              isObscure: true, //
            ),
            const SizedBox(height: 20),
            customButton(context, onPressed: () {}),
            const SizedBox(height: 20, width: 20),
            underButtonText(
              context,
              text: 'Already have an account? ',
              clickableText: 'Login',
              onTextClick: () {
                return PushHelpers.pushReplacement(
                  context,
                  widget: const SignInScreen(), //
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
