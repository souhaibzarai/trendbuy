import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/global_app_bar.dart';
import '../../../../common/widgets/buttons/custom_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../../data/models/user_create.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';
import 'gender_and_age.dart';
import 'sign_in.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeaderText(
                context,
                headerText: 'Sign Up', //
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'First Name', //
                controller: _firstNameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Last Name', //
                controller: _lastNameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Email', //
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                isObscure: true, //
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              customButton(
                context,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
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
                    formKey.currentState!.save();
                  }
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
                    widget: SignInScreen(), //
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
