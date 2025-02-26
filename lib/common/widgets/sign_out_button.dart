import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../common/widgets/custom_button.dart';
import '/features/auth/presentation/screens/sign_in.dart';
import '/utils/helpers/app_navigator.dart';

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
            context,
            widget: SignInScreen(), //
          );
        }
      },
    );
  }
}
