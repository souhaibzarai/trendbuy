import 'package:flutter/material.dart';

class AppCommons {
  const AppCommons._();

  static const EdgeInsetsGeometry padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  );
  static void showScaffold(BuildContext context, {required String message}) {
    if (message == '') {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

}
