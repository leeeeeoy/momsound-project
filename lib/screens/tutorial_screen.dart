import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/nickname_screen.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: [
                Center(
                  child: Text(
                    '튜토리얼1',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  '튜토리얼2',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Center(
                    child: Text(
                  '튜토리얼3',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
            _index != 2
                ? Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topRight,
                    child: RaisedButton(
                      color: Color(0xFFFFA9A9),
                      onPressed: () {
                        print('스킵버튼');
                        Get.to(
                          NicknameScreen(),
                          transition: Transition.fade,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Text(''),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: height * 0.8,
                      left: width * 0.42,
                    ),
                    child: _myCircleStatus(_index),
                  ),
                  _index == 2
                      ? RaisedButton(
                          color: Color(0xFFFFA9A9),
                          onPressed: () {
                            Get.to(
                              NicknameScreen(),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Text(
                            '시작하기',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      : Text(''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myCircleStatus(int index) {
    if (index == 0)
      return Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
        ],
      );
    else if (index == 1)
      return Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
        ],
      );
    else
      return Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ],
      );
  }
}
