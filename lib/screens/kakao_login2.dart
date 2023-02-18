import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:examples_flutter/utils/login_platform.dart';

class KakaoLoginScreen extends StatefulWidget {
  const KakaoLoginScreen({Key? key}) : super(key: key);

  @override
  State<KakaoLoginScreen> createState() => _KakaoLoginScreenState();
}

class _KakaoLoginScreenState extends State<KakaoLoginScreen> {
  @override
  void initState() {
    super.initState();
    KakaoSdk.init(nativeAppKey: 'b54b6d3a839274f2a9da14eb6c0e4a53');
  }

  LoginPlatform _loginPlatform = LoginPlatform.none;

  void signInWithKakao() async {
    // try {
    //   bool isInstalled = await isKakaoTalkInstalled();
    //   // isInstalled = false; // 항상 미설치로 실행, 설치시에 오류 발생
    //
    //   OAuthToken token = isInstalled
    //       ? await UserApi.instance.loginWithKakaoTalk()
    //       : await UserApi.instance.loginWithKakaoAccount();
    //
    //   final url = Uri.https('kapi.kakao.com', '/v2/user/me');
    //
    //   final response = await http.get(
    //     url,
    //     headers: {
    //       HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
    //     },
    //   );
    //
    //   final profileInfo = json.decode(response.body);
    //   print(profileInfo.toString());
    //
    //   setState(() {
    //     _loginPlatform = LoginPlatform.kakao;
    //   });
    // } catch (error) {
    //   print('카카오톡으로 로그인 실패 $error');
    //
    //   try {
    //     OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    //     print('카카오계정으로 로그인 성공 ${token.accessToken}');
    //     setState(() {
    //       _loginPlatform = LoginPlatform.kakao;
    //     });
    //   } catch (error) {
    //     print('카카오계정으로 로그인 실패 $error');
    //   }
    // }

    // 카카오 로그인 구현 예제 : 공식사이트 <= PlatformException(NotSupportError, KakaoTalk is installed but not connected to Kakao account., null, null)
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    bool isLoginOk = false;
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        isLoginOk = true;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          isLoginOk = true;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        isLoginOk = true;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
    if (isLoginOk) {
      setState(() {
        _loginPlatform = LoginPlatform.kakao;
      });
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.facebook:
        break;
      case LoginPlatform.google:
        break;
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.naver:
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _loginPlatform != LoginPlatform.none
              ? _logoutButton()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginButton(
                      // 'kakao_icon',
                      'kakao_logo',
                      signInWithKakao,
                    )
                  ],
                )),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('assets/images/$path.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
