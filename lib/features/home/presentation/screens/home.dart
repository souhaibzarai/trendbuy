import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trendbuy/common/widgets/custom_button.dart';
import '../../../../common/app_commons.dart';
import '../../../../utils/helpers/app_navigator.dart';
import '../../../auth/presentation/screens/sign_in.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: AppCommons.padding,
          child: Column(
            children: [
              Header(), //

              SizedBox(height: 380),
              customButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
