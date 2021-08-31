import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../screens/recoder_screen.dart';
import '../../utils/record_sound.dart';
import 'save_button.dart';

Widget preparePlayButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
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
              'assets/icons/play_arrow-24px (1) 1.svg',
              height: 0.05 * height,
            ),
            onTap: rs.play,
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/record_icon.svg',
              height: 0.08 * height,
            ),
            onTap: rs.record,
          ),
          saveButton(context),
        ],
      ),
    ],
  );
}
