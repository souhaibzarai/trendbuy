import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/category/domain/entities/category.dart';
import '../../../utils/theme/app_colors.dart';

Widget categoryRow(CategoryEntity category) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.fillColor, //
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(category.image),
              alignment: Alignment.center,
              fit: BoxFit.cover, //
            ),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 20), //
        Text(category.title, style: TextStyle(fontSize: 11)),
      ],
    ),
  );
}
