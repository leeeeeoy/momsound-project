import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/screens/diary_screen.dart';
import 'package:momsori/widgets/emotion_button.dart';
import 'package:momsori/models/health.dart';
import 'package:momsori/widgets/health_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiaryEdit extends StatefulWidget {
  // DiaryEdit(Map<DateTime, List> events, [DateTime selectedday]);
  Map<DateTime, List> events;
  DateTime selectedDay;
  Map<DateTime, List> health;
  Map<DateTime, List> diarytext;
  Map<DateTime, List> feeling;

  DiaryEdit(
      this.events, this.health, this.selectedDay, this.feeling, this.diarytext);

  @override
  DiaryEditState createState() => DiaryEditState();
}

class DiaryEditState extends State<DiaryEdit> {
  String _year = DateTime.now().year.toString();
  String _month = DateTime.now().month.toString();
  String _day = DateTime.now().day.toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectDay = widget.selectedDay;
    _year = selectDay.year.toString();
    _day = selectDay.day.toString();
    _month = selectDay.month.toString();
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '다이어리 등록',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: IconButton(
            onPressed: () {
              widget.events.remove(widget.selectedDay);
              widget.health.remove(widget.selectedDay);
              //widget.health.remove(widget.selectedDay);

              Navigator.pop(
                  context, [widget.events, widget.health, widget.diarytext,widget.feeling]);
              print("ㅠㅠㅠ이벤트");
              
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          TextButton(
              onPressed: () {
                if (widget.events[widget.selectedDay] == null) {
                  widget.events[widget.selectedDay] = [0xffffff];
                }
                
                Navigator.pop(
                    context, [widget.events, widget.health, widget.diarytext,widget.feeling]);

                print(widget.events);
              },
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
        child: ListView(children: [
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
                    // '$widget.selectedDay',
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
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFE2EAD2,
                      widget.feeling = widget.feeling,
                      '무기력'
                      ),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFD3E7E4,
                      widget.feeling = widget.feeling,
                      "분노"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFD3EBF4,
                      widget.feeling = widget.feeling,
                      "예민"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFD6E2F3,
                      widget.feeling = widget.feeling,
                      "감정기복"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFD7D5E4,
                      widget.feeling = widget.feeling,
                      "피곤함"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFD7D5EA,
                      widget.feeling = widget.feeling,
                      "불안"),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFECA8C4
                      ,widget.feeling = widget.feeling,
                      "우울"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFEFC2D9,
                      widget.feeling = widget.feeling,
                      "평온"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFF2CDCA,
                      widget.feeling = widget.feeling,
                      "설레임"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0xFFF6E1CD,
                      widget.feeling = widget.feeling,
                      "기쁨"),
                  EmotionButton(widget.events = widget.events,
                      selectDay = selectDay, 0xFFFBF4D8,
                      widget.feeling = widget.feeling,
                      "활기찬"),
                  EmotionButton(
                      widget.events = widget.events,
                      widget.selectedDay = widget.selectedDay,
                      0XFFFFFFFF,
                      widget.feeling = widget.feeling,
                      "기본"),
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
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 40.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 41.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 42.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 42.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 43.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 44.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 51.svg'),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 45.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 46.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 47.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 48.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 49.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 52.svg'),
                  HealthButton(
                      widget.health = widget.health,
                      widget.selectedDay = widget.selectedDay,
                      'assets/icons/Frame 50.svg'),
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
                TextField(
                  onChanged: (text) {
                    setState(() {
                      widget.diarytext[widget.selectedDay] = [text];
                    });
                  },
                ),
               
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
                    InkWell(
                      onTap: () {
                        Get.to(RecoderScreen(),
                            transition: Transition.downToUp);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/record_ic.svg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RecoderScreen(),
                            transition: Transition.downToUp);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/record_ic.svg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RecoderScreen(),
                            transition: Transition.downToUp);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/record_ic.svg',
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
            initialDateTime: widget.selectedDay,
            onDateTimeChanged: (date) {
              var _date = DateFormat('yyyy-MM-dd').format(date).split('-');

              setState(() {
                widget.selectedDay = date;
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
