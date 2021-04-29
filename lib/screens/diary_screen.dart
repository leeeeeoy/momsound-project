import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// final kNow = DateTime.now();
// final kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
// final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);

class DiaryScreen extends StatefulWidget {

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

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
                                '2021.10.13 출산예정',
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
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   child: TableCalendar(
                      //   ),
                      // ),
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
}
