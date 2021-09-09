import 'package:get/get.dart';

import '../utils/record_state.dart';

class RecordStateController extends GetxController {
  RecordState recordState = RecordState.prepareRecord;

  changeRecording() {
    recordState = RecordState.recording;
    update();
  }

  changePause() {
    recordState = RecordState.pause;
    update();
  }

  changePlaying() {
    recordState = RecordState.playing;
    update();
  }

  changePrepareRecord() {
    recordState = RecordState.prepareRecord;
    update();
  }

  changePreparePlay() {
    recordState = RecordState.preparePlay;
    update();
  }
}
