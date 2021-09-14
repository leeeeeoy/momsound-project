import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_sound_controller.dart';
import 'package:momsori/widgets/save_dialog/save_dialog.dart';

class SaveButton extends StatelessWidget {
  final recordSoundController =
      Get.find<RecordSoundController>(tag: 'recordSound');

  @override
  Widget build(BuildContext context) {
    double height = Get.size.height;
    return InkWell(
      child: SvgPicture.asset(
        'assets/icons/stop-black-18dp_2.svg',
        height: 0.07 * height,
      ),
      onTap: () {
        if (!recordSoundController.isPlayerStopped) {
          recordSoundController.stopPlayer();
        }
        if (!recordSoundController.isRecordPaused) {
          recordSoundController.stopRecorder();
        }
        Get.dialog(
          saveDialog(context),
        );
      },
    );
  }
}
