import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_time_controller.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/widgets/record_buttons/save_button.dart';

Widget pauseButton(BuildContext context) {
  final recordTimeController = Get.put(RecordTimeController());
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
            onTap: !rs.isPlayerPaused() ? rs.play : rs.resumePlayer,
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/record_icon.svg',
              height: 0.07 * height,
            ),
            onTap: rs.record,
          ),
          saveButton(context),
        ],
      ),
    ],
  );
}
