import 'package:flutter/material.dart';
import 'package:examples_flutter/utils/const.dart';
import 'package:examples_flutter/utils/navigation_router.dart';
import 'package:examples_flutter/screens/my_home_page.dart';
import 'package:examples_flutter/screens/my_test_list.dart';
import 'package:examples_flutter/screens/splash.dart';
import 'package:examples_flutter/screens/kakao_login.dart';
// import 'package:examples_flutter/screens/kakao_login2.dart';

final routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) =>
      MyHomePage(title: 'Flutter Demo Home Page'),
  "/list": (BuildContext context) => MyTestList(title: Constants.appName),
  "/splash": (BuildContext context) => SplashScreen(),
  "/klogin": (BuildContext context) => KakaoLoginScreen(),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MyTestList(title: Constants.appName),
      home: KakaoLoginScreen(),
      routes: routes,
    );
  }
}
