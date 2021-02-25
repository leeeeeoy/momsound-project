import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:momsori/screens/splash_screen.dart';

void main() {
  KakaoContext.clientId = "8e876e39c2fc3757f013fd2c93a06a2a"; // 네이티브 앱 키
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Momsori',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: SplashScreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
    );
  }
}
