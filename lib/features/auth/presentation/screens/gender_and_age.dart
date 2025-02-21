import 'package:flutter/material.dart';
import 'package:trendbuy/features/auth/presentation/widgets/gender_selector.dart';

import '../../../../common/widgets/app_commons.dart';
import '../../../../common/widgets/global_app_bar.dart';

class GenderAndAgeScreen extends StatelessWidget {
  const GenderAndAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(hideBackButton: true),
      body: SingleChildScrollView(
        padding: AppCommons.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell us about yourself', //
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                genderSelector(context, text: "Male", index: 0),
                const SizedBox(width: 10),
                genderSelector(context, text: "Female", index: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
