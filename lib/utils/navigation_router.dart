import 'package:flutter/material.dart';

class NavigationRouter {
  static void switchToMain(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }

  static void switchToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void switchToList(BuildContext context) {
    Navigator.pushNamed(context, "/list");
  }

  static void switchToSplash(BuildContext context) {
    Navigator.pushNamed(context, "/splash");
  }

  static void switchToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  static void switchToKakaoLogin(BuildContext context) {
    Navigator.pushNamed(context, "/klogin");
  }

  static void switchToNaverLogin(BuildContext context) {
    Navigator.pushNamed(context, "/nlogin");
  }

  static void switchToSQLite(BuildContext context) {
    Navigator.pushNamed(context, "/sqlite");
  }

  static void switchToCheckInternet(BuildContext context) {
    Navigator.pushNamed(context, '/chkinternet');
  }
}
