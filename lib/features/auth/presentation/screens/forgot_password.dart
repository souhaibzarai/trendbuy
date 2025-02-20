import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/app_commons.dart';

import '../../../../common/widgets/global_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: false),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeaderText(context, headerText: 'Reset Password'),
              const SizedBox(height: 20),
              customTextField(context, hintText: 'Email'),
              const SizedBox(height: 20),
              customButton(
                context,
                onPressed: () {},
                buttonText: 'Reset Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
