import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/birth_screen.dart';

class NicknameScreen extends StatefulWidget {
  @override
  _NicknameScreenState createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  '엄마의 이름을 입력해주세요',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  onChanged: (nextText) {
                    print(nextText);
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: '엄마',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 0.1 * height,
                ),
                Text(
                  '아기의 이름을 입력해주세요',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  onChanged: (value) {},
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: '우리 아기',
                    border: OutlineInputBorder(),
                  ),
                ),
                RaisedButton(
                  color: Color(0xFFFFA9A9),
                  onPressed: () {
                    Get.to(
                      BirthScreen(),
                      transition: Transition.fadeIn,
                    );
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
