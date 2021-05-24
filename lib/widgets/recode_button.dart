import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_sound/flutter_sound.dart';
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

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);

    if (_myState == RecodeState.prepare) {
      return Column(
        children: [
          InkWell(
            onTap: record,
            child: Image(
              image: AssetImage('assets/icons/record_start_icon.png'),
            ),
          ),
        ],
      );
    } else if (_myState == RecodeState.record) {
      return Column(
        children: [
          Text('${recordTime.inMilliseconds}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Icon(
                  Icons.play_arrow_sharp,
                  color: Color(0xFFDADADA),
                  size: 50,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.pause_circle_outline_outlined,
                  color: Color(0xFF989898),
                  size: 70,
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
          Text('${recordTime.inMilliseconds}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Icon(
                  Icons.play_arrow_sharp,
                  color: Color(0xFF989898),
                  size: 50,
                ),
                onTap: !_mPlayer.isPaused ? play : resumePlayer,
              ),
              InkWell(
                child: Image(
                  image: AssetImage('assets/icons/record_start_icon.png'),
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
          Text('${recordTime.inMilliseconds}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: !_mPlayer.isStopped
                    ? Icon(
                        Icons.pause,
                        color: Color(0xFF989898),
                        size: 50,
                      )
                    : Icon(
                        Icons.play_arrow_sharp,
                        color: Color(0xFF989898),
                        size: 50,
                      ),
                onTap: !_mPlayer.isStopped ? pausePlayer : play,
              ),
              InkWell(
                child: !_mPlayer.isStopped
                    ? ClipOval(
                        child: Image(
                          image:
                              AssetImage('assets/icons/record_start_icon.png'),
                          color: Color(0xFF989898).withOpacity(0.9),
                          colorBlendMode: BlendMode.color,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image(
                          image:
                              AssetImage('assets/icons/record_start_icon.png'),
                        ),
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
      child: Icon(
        Icons.stop_rounded,
        color: Color(0xFF989898),
        size: 50,
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
