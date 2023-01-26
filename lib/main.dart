import 'package:flutter/material.dart';
import 'package:examples_flutter/utils/const.dart';
import 'package:examples_flutter/utils/navigation_router.dart';
import 'package:examples_flutter/widgets/MyHomePage.dart';
import 'package:examples_flutter/widgets/MyTestList.dart';
import 'package:examples_flutter/screens/splash.dart';

var routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => MyTestList(title: Constants.appName),
  "/Splash": (BuildContext context) => SplashScreen(),
};

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examples Flutter : Demo',
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
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyTestList(title: Constants.appName),
      routes: routes,
    );
  }
}