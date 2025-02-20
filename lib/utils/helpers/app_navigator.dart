import 'package:flutter/material.dart';

class AppNavigator {
  const AppNavigator._();

  static void push(BuildContext context, {required Widget widget}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => widget), //
      ),
    );
  }

  static void pushReplacement(BuildContext context, {required Widget widget}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => widget), //
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
