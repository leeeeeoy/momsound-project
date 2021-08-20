import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/widgets/record_buttons/save_button.dart';

Widget playingButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Obx(() {
        return Text(
          recordTimeController.recordTime.value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );
      }),
      SizedBox(
        height: 0.1 * height,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/pause-black-18dp 2.svg',
              height: 50,
            ),
            onTap: rs.pausePlayer,
          ),
          SvgPicture.asset(
            'assets/icons/record_icon-1.svg',
            height: 60,
          ),
          saveButton(context),
        ],
      ),
    ],
  );
}
