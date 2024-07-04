import 'package:flutter/material.dart';

class GlobalMethod {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
}
