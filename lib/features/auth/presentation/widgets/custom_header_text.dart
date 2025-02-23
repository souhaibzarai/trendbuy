import 'package:flutter/material.dart';

Widget customHeaderText(BuildContext context, {String? headerText}) {
  return Text(
    headerText ?? 'Empty',
    style: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      
    ),
  );
}
