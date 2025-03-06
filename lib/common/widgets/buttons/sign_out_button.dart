import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '/features/auth/presentation/screens/sign_in.dart';
import '../../../utils/helpers/navigator/app_navigator.dart';
import 'custom_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return customButton(
      buttonText: 'Sign Out',
      context,
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        if (FirebaseAuth.instance.currentUser == null) {
          AppNavigator.pushAndRemove(
            // ignore: use_build_context_synchronously TODO
            context,
            widget: SignInScreen(), //
          );
        }
      },
    );
  }
}
