import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/widgets/contants.dart';
import 'package:momsori/widgets/recode_button.dart';

class RecoderScreen extends StatefulWidget {
  @override
  _RecoderScreenState createState() => _RecoderScreenState();
}

class _RecoderScreenState extends State<RecoderScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          Get.back();
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
                RecordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
