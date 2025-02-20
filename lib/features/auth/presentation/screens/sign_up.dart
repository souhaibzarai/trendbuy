import 'package:flutter/material.dart';
import 'package:trendbuy/features/auth/presentation/screens/sign_in.dart';

import '../../../../common/widgets/app_commons.dart';
import '../../../../common/widgets/global_app_bar.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customHeaderText(
              context,
              headerText: 'Sign Up', //
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'First Name', //
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Last Name', //
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Email', //
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Password',
              isObscure: true, //
            ),
            const SizedBox(height: 20),
            customButton(context, onPressed: () {}),
            const SizedBox(height: 10),
            underButtonText(
              context,
              text: 'Already have an account?',
              clickableText: 'Login',
              onTextClick: () {
                return AppNavigator.pushReplacement(
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
