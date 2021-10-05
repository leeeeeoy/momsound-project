import 'package:flutter/material.dart';
import 'package:momsori/screens/diary_edit.dart';

class EmotionButton extends StatelessWidget {
  //EmotionButton(Map<DateTime, List> map, [DateTime dateTime]);

  Map<DateTime, List> events;
  DateTime selectDay;
  int color;

  EmotionButton(this.events, this.selectDay, this.color);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(top: 0),
      onPressed: () {
        
        events[selectDay] = [color];
        
        print(events[selectDay]);
      },
      icon: Icon(
        Icons.circle,
        color: Color(color),
      ),
    );
  }
}