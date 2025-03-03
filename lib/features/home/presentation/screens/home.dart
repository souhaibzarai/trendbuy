import 'package:flutter/material.dart';
import '../widgets/new_in_products.dart';
import '../widgets/home_search_field.dart';
import '../widgets/top_selling_products.dart';
import '../../../../utils/constants/constants.dart';
import '../widgets/categories.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: AppConstants.padding,
          child: Column(
            children: [
              const Header(), //
              const SizedBox(height: 25),
              const SearchButton(),
              const SizedBox(height: 25),
              const Categories(),
              const SizedBox(height: 25),
              const TopSellingProducts(),
              const SizedBox(height: 25),
              const NewInProducts(),
              // SizedBox(height: 380),
              // SignOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
