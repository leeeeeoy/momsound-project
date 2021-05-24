import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/loading_screen.dart';

class SaveScreen extends StatefulWidget {
  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    if (_index == 0)
      return _save1();
    else if (_index == 1)
      return _save2();
    else if (_index == 2)
      return _cate();
    else
      return _save3();
  }

  Widget _save1() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      '녹음 파일을 저장하시겠어요?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            '취소',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFA9A9),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            '저장 안함',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFA9A9),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 1;
                            });
                          },
                          child: Text(
                            '저장',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFA9A9),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _save2() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '녹음 파일 저장',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    TextFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '카테고리',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '전체 ▼',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 0;
                            });
                          },
                          child: Text(
                            '취소',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFA9A9),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 3;
                            });
                          },
                          child: Text(
                            '저장',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFFFA9A9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _save3() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '보관함에서 다시 들어볼 수 있어요!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(
                        () => LoadingScreen(),
                      );
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFFFFA9A9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _cate() {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                children: [
                  Text('카테고리 추가'),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
