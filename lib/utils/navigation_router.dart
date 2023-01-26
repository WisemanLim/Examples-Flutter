import 'package:flutter/material.dart';

class NavigationRouter {
  static void switchToSplash(BuildContext context) {
    Navigator.pushNamed(context, "/Splash");
  }

  static void switchToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/Login");
  }

  static void switchToMain(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }
}