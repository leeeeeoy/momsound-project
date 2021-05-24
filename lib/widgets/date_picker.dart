import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthCard extends StatefulWidget {
  @override
  _BirthCardState createState() => _BirthCardState();
}

class _BirthCardState extends State<BirthCard> {
  String _year = DateTime.now().year.toString();
  String _month = DateTime.now().month.toString();
  String _day = DateTime.now().day.toString();
  String _week = '1';

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Text('${int.parse(_week) ~/ 7} 주차'),
        FlatButton(
          onPressed: _myDatePicker,
          child: Text(
            '$_year 년 $_month 월 $_day 일',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
                _week = (280 -
                        DateTime(int.parse(_year), int.parse(_month),
                                int.parse(_day))
                            .difference(DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day))
                            .inDays)
                    .toString();
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
