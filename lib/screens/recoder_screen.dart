import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/main_screen.dart';
import 'package:momsori/widgets/contants.dart';

enum RecodeState {
  prepare,
  record,
  pause,
  listen,
}

class RecoderScreen extends StatefulWidget {
  @override
  _RecoderScreenState createState() => _RecoderScreenState();
}

class _RecoderScreenState extends State<RecoderScreen> {
  RecodeState _myState = RecodeState.prepare;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.off(() => MainScreen());
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Text('녹음', style: kTitleStyle),
                  ],
                ),
                Container(
                  height: height * 0.65,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  '아이에게 목소리를 들려주세요',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                recoderButtons(_myState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recoderButtons(RecodeState selectedState) {
    if (selectedState == RecodeState.prepare) {
      return InkWell(
        onTap: () {
          setState(() {
            _myState = RecodeState.record;
          });
        },
        child: Image(
          image: AssetImage('assets/icons/record_start_icon.png'),
        ),
      );
    } else if (selectedState == RecodeState.record) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Icon(
              Icons.play_arrow_sharp,
              color: Color(0xFFDADADA),
              size: 50,
            ),
          ),
          InkWell(
            child: Icon(
              Icons.pause_circle_outline_outlined,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {
              setState(() {
                _myState = RecodeState.pause;
              });
            },
          ),
          InkWell(
            child: Icon(
              Icons.stop_rounded,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {},
          ),
        ],
      );
    } else if (selectedState == RecodeState.pause) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Icon(
              Icons.play_arrow_sharp,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {
              setState(() {
                _myState = RecodeState.listen;
              });
            },
          ),
          InkWell(
            child: Image(
              image: AssetImage('assets/icons/record_start_icon.png'),
            ),
            onTap: () {
              setState(() {
                _myState = RecodeState.record;
              });
            },
          ),
          InkWell(
            child: Icon(
              Icons.stop_rounded,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {
              print('세이브');
            },
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Icon(
              Icons.pause,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {
              setState(() {
                _myState = RecodeState.pause;
              });
            },
          ),
          InkWell(
            child: Image(
              image: AssetImage('assets/icons/record_start_icon.png'),
            ),
          ),
          InkWell(
            child: Icon(
              Icons.stop_rounded,
              color: Color(0xFF989898),
              size: 50,
            ),
            onTap: () {
              print('세이브');
            },
          ),
        ],
      );
    }
  }
}
