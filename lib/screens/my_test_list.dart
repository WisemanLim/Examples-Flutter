import 'package:flutter/material.dart';
import 'package:examples_flutter/utils/const.dart';
import 'package:examples_flutter/utils/navigation_router.dart';

class MyTestList extends StatefulWidget {
  const MyTestList({super.key, required this.title});

  final String title;

  @override
  State<MyTestList> createState() => _MyTestListState();
}

class _MyTestListState extends State<MyTestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  'Splash 샘플',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Splash, Guide'),
                leading: Icon(
                  Icons.fastfood,
                  color: Colors.blue[500],
                ),
                onTap: () => {
                  NavigationRouter.switchToSplash(context)
                },
              ),
              ListTile(
                title: const Text(
                  '로그인/회원가입',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('SignIn/SignUp'),
                leading: Icon(
                  Icons.login,
                  color: Colors.blue[500],
                ),
                onTap: () => {},
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  '카카오 소셜 로그인 시험',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Kakao SignIn'),
                leading: Icon(
                  Icons.login,
                  color: Colors.blue[500],
                ),
                onTap: () => {
                  NavigationRouter.switchToKakaoLogin(context)
                },
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  '네이버 소셜 로그인 시험',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Naver SignIn'),
                leading: Icon(
                  Icons.login,
                  color: Colors.blue[500],
                ),
                onTap: () => {
                  NavigationRouter.switchToKakaoLogin(context)
                },
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  '대시보드',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Dashboard'),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.blue[500],
                ),
                onTap: () => {},
              ),
              ListTile(
                title: const Text(
                  '아침,점심,저녁,간식',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Food Balance'),
                leading: Icon(
                  Icons.lunch_dining,
                  color: Colors.blue[500],
                ),
                onTap: () => {},
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  '환경설정',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('Config, Settings'),
                leading: Icon(
                  Icons.app_settings_alt,
                  color: Colors.blue[500],
                ),
                onTap: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}