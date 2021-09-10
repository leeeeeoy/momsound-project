import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:momsori/screens/diary_edit.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  //event
  // Map<DateTime, List<Event>> selectedEvents;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  var today = DateTime.now().toString().split(' ')[0].split('-');

  //TextEditingController _eventController = TextEditingController();
  CalendarBuilders _calendarBuilders = CalendarBuilders();

  @override
  void initState() {
    //event
    //selectedEvents = {};
    _calendarBuilders = CalendarBuilders();
    super.initState();
  }

  //event
  // List<Event> _getEventsfromDay(DateTime date) {
  //   return selectedEvents[date] ?? [];
  // }

  @override
  void dispose() {
    //  _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Text(
                  '다이어리',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(1),
            child: Row(
              children: [
                Text(
                  today[0] +
                      '.' +
                      today[1] +
                      '.' +
                      today[2] +
                      ' 출산예정 / ' +
                      'd_120 / ' +
                      '32주차',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            child: TableCalendar(
              daysOfWeekHeight: 25.0,
              rowHeight: 65,
              //locale: 'ko-KR',
              focusedDay: DateTime.now(),
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              headerStyle: HeaderStyle(
                headerMargin:
                    EdgeInsets.only(left: 40, top: 2, right: 40, bottom: 10),
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.arrow_left),
                rightChevronIcon: Icon(Icons.arrow_right),
                titleTextStyle: const TextStyle(fontSize: 17.0),
              ),
              calendarStyle: CalendarStyle(
                  todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  todayDecoration: BoxDecoration(
                      color: Colors.pink[100], shape: BoxShape.circle),
                  outsideDaysVisible: true,
                  weekendTextStyle: TextStyle().copyWith(color: Colors.red),
                  holidayTextStyle:
                      TextStyle().copyWith(color: Colors.blue[800]),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  selectedDecoration: BoxDecoration(
                    color: Colors.grey[500],
                    shape: BoxShape.circle,
                  )),

              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  var year = focusDay.year;
                  var month = selectDay.month;
                  var day = selectDay.day;
                  var week = selectDay.weekday;
                  selectedDay = selectDay;
                  focusedDay = focusDay;

                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return Container(
                        height: 350,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 30),
                                    // child: Text(
                                    //   today[1] + '/' + today[2],
                                    //   style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    child: Text(
                                      '$year.$month.$day (32주차)',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                      // padding: EdgeInsets.only(right: 0),
                                      icon: Icon(
                                        Icons.close,
                                        size: 30,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '감정상태/건강상태',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Color(0xFFD3E7E4),
                                          size: 36,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/Frame 40.svg',
                                          width: 36,
                                          height: 36,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 0, top: 10, right: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '녹음파일',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/play_arrow-24px_3.svg',
                                                    width: 36,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child: Text(
                                                      '열자를 넘게하면 이렇게 됨!',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '메모',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          TextField()
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // ..._getEventsfromDay(selectedDay).map(
                              //   (Event event) => ListTile(
                              //     title: Text(event.title),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ); //bottom sheet
                });
                print(focusedDay);
                print(selectedDay);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(DiaryEdit());
                  },
                  child: SvgPicture.asset(
                    'assets/icons/edit.svg',
                    height: 70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildEventsMarker(DateTime date) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        border: Border.all(width: 2, color: Colors.blue[300]!)),
  );
}

Widget buildBottomSheet(BuildContext context) {
  return Container();
}
