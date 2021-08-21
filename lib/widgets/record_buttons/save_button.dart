import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/recoder_screen.dart';
import 'package:momsori/widgets/save_dialog/save1.dart';

Widget saveButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return InkWell(
    child: SvgPicture.asset(
      'assets/icons/stop-black-18dp_2.svg',
      height: 0.07 * height,
    ),
    onTap: () {
      if (!rs.isPlayerStopped()) {
        rs.stopRecorder();
      }
      Get.dialog(save1(context));
    },
  );
}
