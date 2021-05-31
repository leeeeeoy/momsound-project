import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/loading_screen.dart';
import 'package:momsori/screens/main_screen.dart';
import 'package:momsori/screens/tutorial_screen.dart';
import 'package:momsori/widgets/contants.dart';


class NicknameScreen extends StatefulWidget {
  @override
  _NicknameScreenState createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  int _selected = 1;
  String _mText = '';
  String _bText = '';
  String _dText = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.off(TutorialScreen());
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Text('정보등록', style: kTitleStyle),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                  onChanged: (nextText) {
                    setState(() {
                      _mText = nextText;
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  maxLength: 6,
                  cursorColor: Color(0xFFFFA9A9),
                  decoration: InputDecoration(
                    hintText: '엄마 이름을 입력해주세요',
                    border: InputBorder.none,
                    counterText: '',
                    fillColor: Color(0xFFE5E5E5),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  onChanged: (nextText) {
                    setState(() {
                      _bText = nextText;
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  maxLength: 6,
                  cursorColor: Color(0xFFFFA9A9),
                  decoration: InputDecoration(
                    hintText: '태아의 태명을 입력해주세요',
                    border: InputBorder.none,
                    counterText: '',
                    fillColor: Color(0xFFE5E5E5),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  onChanged: (nextText) {
                    setState(() {
                      _dText = nextText;
                    });
                  },
                  cursorColor: Color(0xFFFFA9A9),
                  decoration: InputDecoration(
                    hintText: '태아의 출생 예정일',
                    border: InputBorder.none,
                    counterText: '',
                    fillColor: Color(0xFFE5E5E5),
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.06,
                  child: RaisedButton(
                    color: _mText == '' || _bText == '' || _dText == ''
                        ? Color(0xFFDADADA)
                        : Color(0xFFFFA9A9),
                    onPressed: () {
                      Get.to(
                        // todo 서버 실행 시 수정
                        // () => LoadingScreen(),
                        () => MainScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: _mText == '' || _bText == '' || _dText == ''
                            ? Colors.black
                            : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
