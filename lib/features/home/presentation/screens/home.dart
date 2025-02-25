import 'package:flutter/material.dart';
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
          child: Column(children: [Header()]),
        ),
      ),
    );
  }
}
