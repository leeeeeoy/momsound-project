import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_state_controller.dart';
import 'package:momsori/utils/record_sound.dart';
import 'package:momsori/utils/record_state.dart';
import 'package:momsori/widgets/contants.dart';
import 'package:momsori/widgets/record_buttons/pause_button.dart';
import 'package:momsori/widgets/record_buttons/playing_button.dart';
import 'package:momsori/widgets/record_buttons/prepare_play_button.dart';
import 'package:momsori/widgets/record_buttons/prepare_record_button.dart';
import 'package:momsori/widgets/record_buttons/recording_button.dart';

final RecordSound rs = RecordSound();

class RecoderScreen extends StatefulWidget {
  @override
  _RecoderScreenState createState() => _RecoderScreenState();
}

class _RecoderScreenState extends State<RecoderScreen> {
  final recordStateController = Get.put(RecordStateController());

  @override
  void initState() {
    rs.initSound();
    super.initState();
  }

  // @override
  // void dispose() {
  //   rs.disposeSound();
  //   recordStateController.changePrepareRecord();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          rs.disposeSound();
                          recordStateController.changePrepareRecord();
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width: 40,
                          child: Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '녹음',
                      style: kTitleStyle,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/images/check.svg',
                  height: 0.65 * height,
                ),
                Expanded(
                  child: GetBuilder(
                    init: recordStateController,
                    builder: (RecordStateController _) {
                      if (_.recordState == RecordState.prepareRecord) {
                        return prepareRecordButton(context);
                      } else if (_.recordState == RecordState.recording) {
                        return recordingButton(context);
                      } else if (_.recordState == RecordState.pause) {
                        return pauseButton(context);
                      } else if (_.recordState == RecordState.preparePlay) {
                        return preparePlayButton(context);
                      } else {
                        return playingButton(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
