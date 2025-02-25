import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: AppColors.errorColor, //
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 36, 50, 70), //
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: AppColors.tertiaryColor, //
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white, //
          ),
        ),
      ],
    );
  }
}
