import 'package:flutter/material.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import '../../data/models/user_sign_in.dart';
import '../../../../common/widgets/global_app_bar.dart';
import 'password_screen.dart';
import 'sign_up.dart';
import '../../../../common/widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/under_button_text.dart';
import '../../../../utils/helpers/app_navigator.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: Constants.padding,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeaderText(context, headerText: 'Sign In'),
              const SizedBox(height: 20),
              CustomTextField(hintText: 'Email', controller: emailContoller),
              const SizedBox(height: 20),
              customButton(
                context,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AppNavigator.push(
                      context,
                      widget: PasswordScreen(
                        userSignIn: UserSignIn(
                          email: emailContoller.text.trim(),
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
                text: 'Don\'t have an account?',
                clickableText: 'Register',
                onTextClick: () {
                  return AppNavigator.push(
                    context,
                    widget: SignUpScreen(), //
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
