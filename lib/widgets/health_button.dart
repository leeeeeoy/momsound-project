import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HealthButton extends StatelessWidget {
  Map<DateTime, List> health;
  DateTime selectDay;
  String image;

  HealthButton(this.health, this.selectDay, this.image);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(top: 0),
      onPressed: () {
        health[selectDay] = [image];
        health[selectDay]!.add('?????');

        print(health[selectDay]);
      },
      icon: SvgPicture.asset(image),
    );
  }
}
