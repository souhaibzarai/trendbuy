import 'package:flutter/material.dart';
import 'sign_in.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../../common/app_commons.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/global_app_bar.dart';
import '../../../../utils/helpers/app_navigator.dart';

class ResetSentScreen extends StatelessWidget {
  const ResetSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImagesPath.emailSent,
                width: 200, //
              ),
              const Text(
                'We sent you an Email to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor, //
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 200,
                child: customButton(
                  context,
                  onPressed: () {
                    AppNavigator.pushReplacement(
                      context,
                      widget: SignInScreen(),
                    );
                  },
                  buttonText: 'Sign In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
