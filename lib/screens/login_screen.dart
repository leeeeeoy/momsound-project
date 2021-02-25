import 'package:flutter/material.dart';
import 'package:momsori/logins/kakao_login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kakao login test!!'),
      ),
      body: Center(
        child: KakaoLogin(),
      ),
    );
  }
}
