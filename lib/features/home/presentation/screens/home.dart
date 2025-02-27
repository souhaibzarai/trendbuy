import 'package:flutter/material.dart';
import 'package:trendbuy/features/home/presentation/widgets/search.dart';
import 'package:trendbuy/features/home/presentation/widgets/top_selling.dart';
import 'package:trendbuy/utils/constants/constants.dart';
import '../widgets/categories.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: Constants.padding,
          child: Column(
            children: [
              const Header(), //
              const SizedBox(height: 25),
              const Search(),
              const SizedBox(height: 25),
              const Categories(),
              const SizedBox(height: 25),
              const TopSelling(),
              // SizedBox(height: 380),
              // SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
