import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DiaryScreen extends StatefulWidget {

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  CalendarController _calendarController = CalendarController();
  Map<DateTime, List> _events; // todo: events 변수 echo와 연결
  List<dynamic> _selectedEvents;
  var today = DateTime.now().toString().split(' ')[0].split('-');

  @override
  initState(){
    super.initState();
    _calendarController = CalendarController();
    _events = {
      DateTime.utc(2021, 6, 1): ['Event 1'],
      DateTime.utc(2021, 6, 3): ['Event 1'],
      DateTime.utc(2021, 6, 13): ['Event 1'],
      DateTime.utc(2021, 6, 21): ['Event 1'],
      DateTime.utc(2021, 6, 28): ['Event 1'],
      DateTime.utc(2021, 6, 31): ['Event 1'],
    };
    _selectedEvents = [];
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '다이어리',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                today[0] + '.' + today[1] + '.' + today[2] + ' 출산예정',
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                '/',
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: Text(
                                'D-120',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: TableCalendar(
                          calendarController: _calendarController,
                          locale: 'ko-KR', // todo 언어 자동 감지 구현
                          events: _events,
                            onDaySelected: (date, events,holidays) {
                              setState(() {
                                _selectedEvents = events;
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 8),
                                        child: ListView(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Card(
                                                child: ListTile(
                                                  title: Text(today[0] + '.' + today[1] + '.' + today[2],),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 8),
                                                    child: Row(
                                                      children: [
                                                        Text('감정상태'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 8),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.only(bottom: 8),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.green,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.lightBlueAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blueAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blue,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blueGrey,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.purple,),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets.only(bottom: 8),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.pinkAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.deepPurpleAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.redAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.brown,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.deepOrangeAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.yellow,),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 8),
                                                    child: Row(
                                                      children: [
                                                        Text('건강상태'),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 8),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.only(bottom: 8),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.green,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.lightBlueAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blueAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blue,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.blueGrey,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.purple,),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets.only(bottom: 8),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.pinkAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.deepPurpleAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.redAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.brown,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.deepOrangeAccent,),
                                                              ),
                                                              Expanded(
                                                                child: Icon(Icons.circle, color: Colors.yellow,),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('메모'),
                                                    ],
                                                  ),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        labelText: '하루종일비가온다하루종일비가온다하루종일비가온다하루종일비가온다하루종일비가온다하루종일비가온다하루종일비가온다'
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('녹음'),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: FloatingActionButton(
                                                            onPressed: () {
                                                            },
                                                            backgroundColor: Colors.white,
                                                            child: Icon(Icons.fiber_manual_record, color: Colors.redAccent,),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: FloatingActionButton(
                                                            onPressed: () {
                                                            },
                                                            backgroundColor: Colors.white,
                                                            child: Icon(Icons.fiber_manual_record, color: Colors.redAccent,),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: FloatingActionButton(
                                                            onPressed: () {
                                                            },
                                                            backgroundColor: Colors.white,
                                                            child: Icon(Icons.fiber_manual_record, color: Colors.redAccent,),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                            },
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: buildBottomSheet);
                        },
                        backgroundColor: Colors.lightBlueAccent,
                        child: Icon(Icons.add),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }
}
