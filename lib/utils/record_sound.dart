import 'dart:async';
import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../getx_controller/record_time_controller.dart';
import '../getx_controller/record_state_controller.dart';

final recordTimeController = Get.put(RecordTimeController());

final recordStateController = Get.put(RecordStateController());

class RecordSound {
  Codec _codec = Codec.aacMP4;
  FlutterSoundPlayer? _mPlayer;
  FlutterSoundRecorder? _mRecorder;
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String _mPath = 'momsound.m4a';

  RecordSound._();

  static final RecordSound _rsInstance = RecordSound._();

  factory RecordSound() {
    return _rsInstance;
  }

  void initSound() {
    _mPlayer = FlutterSoundPlayer();
    _mRecorder = FlutterSoundRecorder();
    _mPlayer!.openAudioSession().then((value) {
      _mPlayerIsInited = true;
    });

    openTheRecorder().then((value) {
      _mRecorderIsInited = true;
    });
  }

  void disposeSound() {
    _mPlayer!.closeAudioSession();
    _mRecorder!.closeAudioSession();
    _mPlayer = null;
    _mRecorder = null;
  }

  bool isPlayerPaused() {
    return _mPlayer!.isPaused;
  }

  bool isRecordPaused() {
    return _mRecorder!.isPaused;
  }

  bool isRecordStopped() {
    return _mRecorder!.isStopped;
  }

  bool isPlayerStopped() {
    return _mPlayer!.isStopped;
  }

  Future<void> openTheRecorder() async {
    var recordState = await Permission.microphone.request();
    var storageState = await Permission.storage.request();

    if (recordState != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }

    if (storageState != PermissionStatus.granted) {
      print('저장 권한 에러');
    }

    await _mRecorder!.openAudioSession();
    _mRecorderIsInited = true;
  }

  void record() async {
    _mRecorder!
        .startRecorder(
      codec: _codec,
      toFile: _mPath,
    )
        .then((value) {
      recordStateController.changeRecording();
    });
    _mRecorder!.setSubscriptionDuration(Duration(seconds: 1));
    _mRecorder!.onProgress!.listen((e) {
      recordTimeController.updateRecordTime(recordTimeValue(e.duration));
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      _mplaybackReady = true;
      recordStateController.changePreparePlay();
    });
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
            fromURI: _mPath,
            codec: _codec,
            whenFinished: () {
              recordStateController.changePrepareRecord();
            })
        .then((value) {
      recordStateController.changePlaying();
    });
  }

  void pausePlayer() {
    _mPlayer!.pausePlayer().then((value) {
      recordStateController.changePause();
    });
  }

  void resumePlayer() {
    _mPlayer!.resumePlayer().then((value) {
      recordStateController.changePlaying();
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      recordStateController.changePreparePlay();
    });
  }

  void saveFile(String fileName, String category) async {
    String inputFile = '/data/user/0/com.example.momsori/cache/$_mPath';
    var tempDir = await getExternalStorageDirectory();
    var directory = Directory(
        '${tempDir!.parent.parent.parent.parent.path}/momsound/$category/');
    print(directory);
    directory.create(recursive: true);
    String outputFile = '${directory.path}$fileName.m4a';
    await flutterSoundHelper.convertFile(
        inputFile, Codec.aacMP4, outputFile, Codec.aacADTS);
  }

  String recordTimeValue(Duration recordTime) {
    var time = recordTime.inSeconds;
    if (time < 10) {
      return '00:0$time';
    } else if (time < 60) {
      return '00:$time';
    } else if (time < 600) {
      var min = time ~/ 60 + 1;
      var sec = time - min * 60;
      if (sec < 10) {
        return '0$min:0$sec';
      } else {
        return '0$min:$sec';
      }
    } else {
      var min = time ~/ 60 + 1;
      var sec = time - min * 60;
      if (sec < 10) {
        return '$min:0$sec';
      } else {
        return '$min:$sec';
      }
    }
  }
}
