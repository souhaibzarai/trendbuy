import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../common/widgets/buttons/custom_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/navigator/app_navigator.dart';
import '../../../../utils/theme/app_colors.dart';
import 'sign_in.dart';

class ResetSentScreen extends StatelessWidget {
  const ResetSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: AppConstants.padding,
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
