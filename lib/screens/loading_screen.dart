import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:momsori/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // 서버 실행시키면 IP 주소 나옵니다
  // final String url = 'http://192.168.0.33:8080/user/1'; // 요엘님 ip 주소
  final String url = 'http://114.207.171.118:8080/user/1'; // 영록의 ip 주소
  var jsonData;

  @override
  void initState() {
    super.initState();
    _getJsonData();
  }

  void _getJsonData() async {
    var res = await http.get(url);
    jsonData = jsonDecode(res.body);

    Get.to(
      () => MainScreen(),
      arguments: jsonData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
