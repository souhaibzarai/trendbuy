import 'package:flutter/material.dart';
import '/features/category/presentation/widgets/categories.dart';
import '../../../../common/app_commons.dart';
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
              const SizedBox(height: 25),
              Categories(),

              // SizedBox(height: 380),
              // SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
