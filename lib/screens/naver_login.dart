import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_naver_login/flutter_naver_login.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

class NaverLoginScreen extends StatefulWidget {
  const NaverLoginScreen({Key? key}) : super(key: key);
  @override
  _NaverLoginScreenState createState() => new _NaverLoginScreenState();
}

class _NaverLoginScreenState extends State<NaverLoginScreen> {
  bool isLogin = false;
  String? accesToken;
  String? expiresAt;
  String? tokenType;
  String? name;
  String? refreshToken;

  /// Show [error] content in a ScaffoldMessenger snackbar
  void _showSnackError(String error) {
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Naver Login Sample',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Column(
            children: [
              Text('isLogin: $isLogin\n'),
              Text('accesToken: $accesToken\n'),
              Text('refreshToken: $refreshToken\n'),
              Text('tokenType: $tokenType\n'),
              Text('user: $name\n'),
            ],
          ),
          ElevatedButton(
            onPressed: buttonLoginPressed,
            child: const Text("LogIn"),
          ),
          ElevatedButton(
            onPressed: buttonLogoutPressed,
            child: const Text("LogOut"),
          ),
          ElevatedButton(
            onPressed: buttonLogoutAndDeleteTokenPressed,
            child: const Text("LogOutAndDeleteToken"),
          ),
          ElevatedButton(
            onPressed: buttonTokenPressed,
            child: const Text("GetToken"),
          ),
          ElevatedButton(
            onPressed: buttonGetUserPressed,
            child: const Text("GetUser"),
          )
        ],
      ),
    );
  }

  Future<void> buttonLoginPressed() async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      setState(() {
        name = res.account.nickname;
        isLogin = true;
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }

  Future<void> buttonTokenPressed() async {
    try {
      final NaverAccessToken res = await FlutterNaverLogin.currentAccessToken;
      setState(() {
        refreshToken = res.refreshToken;
        accesToken = res.accessToken;
        tokenType = res.tokenType;
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }

  Future<void> buttonLogoutPressed() async {
    try {
      await FlutterNaverLogin.logOut();
      setState(() {
        isLogin = false;
        accesToken = null;
        tokenType = null;
        name = null;
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }

  Future<void> buttonLogoutAndDeleteTokenPressed() async {
    try {
      await FlutterNaverLogin.logOutAndDeleteToken();
      setState(() {
        isLogin = false;
        accesToken = null;
        tokenType = null;
        name = null;
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }

  Future<void> buttonGetUserPressed() async {
    try {
      final NaverAccountResult res = await FlutterNaverLogin.currentAccount();
      setState(() => name = res.name);
    } catch (error) {
      _showSnackError(error.toString());
    }
  }
}