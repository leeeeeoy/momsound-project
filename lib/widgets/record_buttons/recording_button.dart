import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_sound_controller.dart';
import 'package:momsori/widgets/record_buttons/save_button.dart';

class RecordingButton extends StatelessWidget {
  final recordSoundController =
      Get.find<RecordSoundController>(tag: 'recordSound');

  @override
  Widget build(BuildContext context) {
    double height = Get.size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text(
              recordSoundController.recordTime.value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )),
        SizedBox(
          height: 0.1 * height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(
                'assets/icons/play_arrow-24px.svg',
                height: 0.05 * height,
              ),
            ),
            InkWell(
              child: SvgPicture.asset(
                'assets/icons/pause_ic.svg',
                height: 0.07 * height,
              ),
              onTap: recordSoundController.stopRecorder,
            ),
            SaveButton(),
          ],
        ),
      ],
    );
  }
}
