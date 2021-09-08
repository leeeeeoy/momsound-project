import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiaryEdit extends StatefulWidget {
  @override
  _DiaryEditState createState() => _DiaryEditState();
}

class _DiaryEditState extends State<DiaryEdit> {
  String _year = DateTime.now().year.toString();
  String _month = DateTime.now().month.toString();
  String _day = DateTime.now().day.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '다이어리 등록',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '확인',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ListView(
          children: [
          Row(
            children: [
              Container(
                //width: double.maxFinite,
                width: 390,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _myDatePicker();
                  },
                  child: Text(
                    '$_year 년 $_month 월 $_day 일',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 0.0,
                      side: BorderSide(color: Colors.black)),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Row(
              children: [
                Text(
                  '감정상태',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.only(top: 0),
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle,
                      color: Color(0xFFE2EAD2),
                    ),
                  ),
                  Icon(Icons.circle, color: Color(0xFFD3E7E4)),
                  Icon(Icons.circle, color: Color(0xFFD3EBF4)),
                  Icon(Icons.circle, color: Color(0xFFD6E2F3)),
                  Icon(Icons.circle, color: Color(0xFFD7D5E4)),
                  Icon(Icons.circle, color: Color(0xFFD7D5EA)),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.circle, color: Color(0xFFECA8C4)),
                  Icon(Icons.circle, color: Color(0xFFEFC2D9)),
                  Icon(Icons.circle, color: Color(0xFFF2CDCA)),
                  Icon(Icons.circle, color: Color(0xFFF6E1CD)),
                  Icon(Icons.circle, color: Color(0xFFFBF4D8)),
                  Icon(Icons.circle, color: Color(0XFFFFFFFF)),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Row(
              children: [
                Text(
                  '건강상태',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset('assets/icons/Frame 40.svg'),
                  SvgPicture.asset('assets/icons/Frame 41.svg'),
                  SvgPicture.asset('assets/icons/Frame 42.svg'),
                  SvgPicture.asset('assets/icons/Frame 42.svg'),
                  SvgPicture.asset('assets/icons/Frame 43.svg'),
                  SvgPicture.asset('assets/icons/Frame 44.svg'),
                  SvgPicture.asset('assets/icons/Frame 51.svg'),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset('assets/icons/Frame 45.svg'),
                  SvgPicture.asset('assets/icons/Frame 46.svg'),
                  SvgPicture.asset('assets/icons/Frame 47.svg'),
                  SvgPicture.asset('assets/icons/Frame 48.svg'),
                  SvgPicture.asset('assets/icons/Frame 49.svg'),
                  SvgPicture.asset('assets/icons/Frame 52.svg'),
                  SvgPicture.asset('assets/icons/Frame 50.svg'),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '메모',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                TextField()
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '녹음',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap: () {
                      Get.to(RecoderScreen(), transition: Transition.downToUp);
                    },
                    child: SvgPicture.asset('assets/icons/record_ic.svg',
                    width: 60,
                    height: 60,
                    ),
                    ),
                    InkWell(onTap: () {
                      Get.to(RecoderScreen(), transition: Transition.downToUp);
                    },
                    child: SvgPicture.asset('assets/icons/record_ic.svg',
                    width: 60,
                    height: 60,
                    ),
                    ),
                    InkWell(onTap: () {
                      Get.to(RecoderScreen(), transition: Transition.downToUp);
                    },
                    child: SvgPicture.asset('assets/icons/record_ic.svg',
                    width: 60,
                    height: 60,
                    ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _myDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (date) {
              var _date = DateFormat('yyyy-MM-dd').format(date).split('-');
              setState(() {
                _year = _date[0];
                _month = _date[1];
                _day = _date[2];
              });
            },
            minimumYear: 2000,
            maximumYear: 2100,
            mode: CupertinoDatePickerMode.date,
          ),
        );
      },
    );
  }
}
