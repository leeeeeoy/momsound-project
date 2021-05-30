import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/save_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

enum RecodeState {
  prepare,
  record,
  pause,
  listen,
}

class RecordButton extends StatefulWidget {
  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  RecodeState _myState = RecodeState.prepare;
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String _mPath = 'test.m4a';
  String _fileName;
  Duration recordTime = Duration.zero;

  @override
  void initState() {
    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mPlayer.closeAudioSession();
    _mPlayer = null;
    _mRecorder.closeAudioSession();
    _mRecorder = null;
    super.dispose();
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

    await _mRecorder.openAudioSession();
    _mRecorderIsInited = true;
  }

  void record() async {
    _mRecorder
        .startRecorder(
      toFile: _mPath,
    )
        .then((value) {
      setState(() {
        _myState = RecodeState.record;
      });
    });
    _mRecorder.onProgress.listen((e) {
      setState(() {
        recordTime = e.duration;
      });
    });
  }

  void stopRecorder() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        _mplaybackReady = true;
        _myState = RecodeState.pause;
      });
    });
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder.isStopped &&
        _mPlayer.isStopped);
    _mPlayer
        .startPlayer(
            fromURI: _mPath,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {
        _myState = RecodeState.listen;
      });
    });
  }

  void pausePlayer() {
    _mPlayer.pausePlayer().then((value) {
      setState(() {
        _myState = RecodeState.pause;
      });
    });
  }

  void resumePlayer() {
    _mPlayer.resumePlayer().then((value) {
      setState(() {
        _myState = RecodeState.listen;
      });
    });
  }

  void stopPlayer() {
    _mPlayer.stopPlayer().then((value) {
      setState(() {
        _myState = RecodeState.pause;
      });
    });
  }

  void saveFile() async {
    String inputFile = '/data/user/0/com.example.momsori/cache/$_mPath';
    var tempDir = await getExternalStorageDirectory();
    var directory =
        Directory('${tempDir.parent.parent.parent.parent.path}/momsori/');
    directory.create(recursive: true);
    String outputFile = '${directory.path}$_fileName.m4a';
    await flutterSoundHelper.convertFile(
        inputFile, Codec.aacADTS, outputFile, Codec.aacADTS);
  }

  String recordTimeValue() {
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    if (_myState == RecodeState.prepare) {
      return Column(
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
            onTap: record,
            child: SvgPicture.asset(
              'assets/icons/record_icon.svg',
              height: 70,
            ),
          ),
        ],
      );
    } else if (_myState == RecodeState.record) {
      return Column(
        children: [
          Text(
            recordTimeValue(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 0.1 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  'assets/icons/play_arrow-24px.svg',
                  height: 50,
                ),
              ),
              InkWell(
                child: SvgPicture.asset(
                  'assets/icons/pause_ic.svg',
                  height: 60,
                ),
                onTap: stopRecorder,
              ),
              _saveButton(),
            ],
          ),
        ],
      );
    } else if (_myState == RecodeState.pause) {
      return Column(
        children: [
          Text(
            recordTimeValue(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 0.1 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  'assets/icons/play_arrow-24px (1) 1.svg',
                  height: 50,
                ),
                onTap: !_mPlayer.isPaused ? play : resumePlayer,
              ),
              InkWell(
                child: SvgPicture.asset(
                  'assets/icons/record_icon.svg',
                  height: 60,
                ),
                onTap: record,
              ),
              _saveButton(),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            recordTimeValue(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 0.1 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: !_mPlayer.isStopped
                    ? SvgPicture.asset(
                        'assets/icons/pause-black-18dp 2.svg',
                        height: 50,
                      )
                    : SvgPicture.asset(
                        'assets/icons/play_arrow-24px (1) 1.svg',
                        height: 50,
                      ),
                onTap: !_mPlayer.isStopped ? pausePlayer : play,
              ),
              InkWell(
                child: !_mPlayer.isStopped
                    ? SvgPicture.asset(
                        'assets/icons/record_icon-1.svg',
                        height: 60,
                      )
                    : SvgPicture.asset(
                        'assets/icons/record_icon.svg',
                        height: 60,
                      ),
                onTap: !_mPlayer.isStopped ? null : record,
              ),
              _saveButton(),
            ],
          ),
        ],
      );
    }
  }

  Widget _saveButton() {
    return InkWell(
      child: SvgPicture.asset(
        'assets/icons/stop-black-18dp_2.svg',
        height: 60,
      ),
      onTap: () {
        if (!_mRecorder.isStopped) {
          stopRecorder();
        }
        Get.dialog(
          SaveScreen(),
        );
      },
    );
  }
}
