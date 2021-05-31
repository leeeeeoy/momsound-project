import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/screens/taedam_screen.dart';

import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // DateTime date = DateTime.parse(user.babyBirth); todo 서버 실행시 주석 해제
  DateTime date = DateTime.now();

  _babyDay() {
    var k = DateTime(
      date.year,
      date.month,
      date.day,
    )
        .difference(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ))
        .inDays;
    return k;
  }

  _babyWeek() {
    return (40 - _babyDay() ~/ 7);
  }

  _babyMonth() {
    return (_babyWeek() ~/ 4 + 1);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.05 * height,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_babyMonth()}개월',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(TaedamScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/message.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01 * height,
          ),
          Container(
            height: 0.05 * height,
            child: Center(
              child: Text(
                '${user.babyNickname}',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_babyWeek()} 주차',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 0.05 * width,
              ),
              Text(
                '${user.babyBirth} 예정',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 0.6 * height,
            child: Stack(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/baby_tell_ic.svg',
                            height: 0.1 * height,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              '엄마 사랑해요!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFA9A9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/images/check.svg',
                        height: 0.4 * height,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Center(
                      child: Text(
                        'D - ${_babyDay()}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFA9A9),
                        ),
                      ),
                    ),
                  ),
                  right: 0.1 * width,
                  bottom: 0.1 * height,
                ),
              ],
            ),
          ),
          Container(
            height: 0.1 * height,
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.to(RecoderScreen());
                },
                child: SvgPicture.asset(
                  'assets/icons/record_ic.svg',
                  width: 0.2 * height,
                  height: 0.2 * width,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
