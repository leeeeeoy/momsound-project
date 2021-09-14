import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_sound_controller.dart';

class PrepareRecordButton extends StatelessWidget {
  final recordSoundController =
      Get.find<RecordSoundController>(tag: 'recordSound');

  @override
  Widget build(BuildContext context) {
    double height = Get.size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '아이에게 목소리를 들려주세요',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 0.05 * height,
        ),
        InkWell(
          onTap: recordSoundController.record,
          child: SvgPicture.asset(
            'assets/icons/record_icon.svg',
            height: 0.08 * height,
          ),
        ),
      ],
    );
  }
}
