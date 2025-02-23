import 'package:flutter/material.dart';
import 'package:trendbuy/features/auth/data/models/user_create.dart';
import 'gender_and_age.dart';
import 'sign_in.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/widgets/global_app_bar.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../../../../common/widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              controller: _firstNameController,
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Last Name', //
              controller: _lastNameController,
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Email', //
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            customTextField(
              context,
              hintText: 'Password',
              isObscure: true, //
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            customButton(
              context,
              onPressed: () {
                AppNavigator.push(
                  context,
                  widget: GenderAndAgeScreen(
                    userCreation: UserCreation(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ), //
                );
              },
            ),
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
