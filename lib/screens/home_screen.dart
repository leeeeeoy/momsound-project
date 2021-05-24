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
  DateTime date = DateTime.parse(user.babyBirth);

  _babyMonth() {
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
    return (k ~/ 7);
  }

  _babyWeek() {
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
    print(k);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('+개월'),
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
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '${user.babyNickname}',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_babyMonth()} 주차',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
          Container(
            padding: EdgeInsets.all(5),
            height: 500,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1496174742515-d2146dcf8e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGN1dGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                Positioned(
                  child: Text(
                    'D-day',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  right: 50,
                  bottom: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.05 * height),
            child: Center(
              child: Container(
                child: InkWell(
                  onTap: () {
                    Get.to(RecoderScreen());
                  },
                  child: SvgPicture.asset(
                    'assets/icons/record_ic.svg',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
