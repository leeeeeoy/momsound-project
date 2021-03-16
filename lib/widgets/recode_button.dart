import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/main_screen.dart';
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
    if (_myState == RecodeState.prepare) {
      return InkWell(
        onTap: record,
        child: Image(
          image: AssetImage('assets/icons/record_start_icon.png'),
        ),
      );
    } else if (_myState == RecodeState.record) {
      return Row(
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
      );
    } else if (_myState == RecodeState.pause) {
      return Row(
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
      );
    } else {
      return Row(
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
                      image: AssetImage('assets/icons/record_start_icon.png'),
                      color: Color(0xFF989898).withOpacity(0.9),
                      colorBlendMode: BlendMode.color,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipOval(
                    child: Image(
                      image: AssetImage('assets/icons/record_start_icon.png'),
                    ),
                  ),
            onTap: !_mPlayer.isStopped ? null : record,
          ),
          _saveButton(),
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
        Get.defaultDialog(
          title: '녹음 파일을 저장하시겠어요?',
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          middleText: '',
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Text(
                  '취소',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
              Text(
                '저장안함',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              InkWell(
                child: Text(
                  '저장',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: _saveAlert,
              ),
            ],
          ),
        );
      },
    );
  }

  _saveAlert() {
    Get.back();
    Get.defaultDialog(
      title: '녹음 파일 저장',
      middleText: '',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                _fileName = value;
              });
              print(_fileName);
            },
          ),
          Text(
            '카테고리',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            '전체',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '취소',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              InkWell(
                child: Text(
                  '저장',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onTap: () {
                  Get.back();
                  saveFile();
                  Get.defaultDialog(
                    title: '보관함에서 다시 들어볼 수 있어요!',
                    middleText: '',
                    content: InkWell(
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      onTap: () {
                        Get.offAll(() => MainScreen());
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
