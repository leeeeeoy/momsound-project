import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/user_controller.dart';
import 'package:momsori/screens/menu_screen.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/widgets/custom_bubble/bubble_painter2.dart';
import 'package:momsori/widgets/topics.dart';

class HomeScreen extends StatelessWidget {
  final user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.02 * height,
          ),
          Container(
            height: 0.05 * height,
            child: Padding(
              padding: EdgeInsets.only(
                left: 0.05 * width,
                right: 0.05 * width,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${user.babyWeek()}주차',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 0.06 * width,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(MenuScreen());
                    },
                    child: SvgPicture.asset(
                      'assets/icons/세팅선택x.svg',
                      width: 0.08 * width,
                      height: 0.08 * width,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.04 * height,
          ),
          Container(
            height: 0.05 * height,
            child: Center(
              child: Text(
                '${user.userName}',
                style: TextStyle(
                  fontSize: 0.04 * height,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            height: 0.03 * height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${user.babyBirth} 예정',
                  style: TextStyle(
                    fontSize: 0.02 * height,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 0.025 * width,
                ),
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 0.02 * height,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 0.025 * width,
                ),
                Text(
                  'D-${user.babyDay()}',
                  style: TextStyle(
                    fontSize: 0.02 * height,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 0.47 * height,
            child: Column(
              children: [
                Container(
                  height: width * 0.2,
                  width: width * 0.8,
                  child: CustomPaint(
                    painter: BubblePainter2(),
                    child: Center(
                      child: Text(
                        topic[0],
                        style: TextStyle(
                          color: Color(0xFFD7C1B9),
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Image.asset(
                    "assets/images/gif_check.gif",
                    height: 0.32 * height,
                    width: 0.7 * width,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.1 * height,
            child: InkWell(
              onTap: () {
                Get.to(
                  RecoderScreen(),
                  transition: Transition.downToUp,
                );
              },
              child: SvgPicture.asset(
                'assets/icons/record_ic.svg',
                width: 0.2 * height,
                height: 0.2 * width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
