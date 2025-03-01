import 'package:flutter/material.dart';
import '../../../features/category/domain/entities/category.dart';

Widget categoryColumn(BuildContext context, CategoryEntity category) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.image),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(height: 8), //
      Text(category.title, style: TextStyle(fontSize: 11)),
    ],
  );
}
