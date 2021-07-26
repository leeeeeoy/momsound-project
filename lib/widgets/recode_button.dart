import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Duration recordTime = Duration.zero;

  bool isChecked = false;

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
        Directory('${tempDir.parent.parent.parent.parent.path}/momsound/');
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
        _saveGet1();
      },
    );
  }

  _saveGet1() {
    Get.dialog(
      _save1(),
    );
  }

  _saveGet2() {
    Get.back();
    Get.dialog(
      _save2(),
    );
  }

  _saveGet3() {
    Get.back();
    Get.dialog(
      _save3(),
    );
  }

  // _cateGet() {
  //   Get.back();
  //   Get.dialog(
  //     _cate(),
  //   );
  // }

  _save1() {
    return Column(
      children: [
        SizedBox(
          height: 0.6 * MediaQuery.of(context).size.height,
        ),
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(1),
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                Text(
                  '녹음 파일을 저장하시겠어요?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        '취소',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFFFFA9A9),
                        ),
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xFFFFA9A9),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '저장안함',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFFFFA9A9),
                        ),
                      ),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFFFFA9A9),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _saveGet2();
                      },
                      child: Text(
                        '저장',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFFFFA9A9),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _save2() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediaQuery.of(context).viewInsets.bottom == 0.0
              ? SizedBox(height: 0.6 * MediaQuery.of(context).size.height)
              : Container(),
          Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(1),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '녹음 파일 저장',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  TextFormField(
                    onChanged: (nextText) {
                      setState(() {
                        _fileName = nextText;
                        print(_fileName);
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '카테고리',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isChecked == false &&
                            MediaQuery.of(context).viewInsets.bottom > 0.0)
                          isChecked = !isChecked;
                        print(isChecked);
                      });
                    },
                    child: Text(
                      '전체 ▼',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.dialog(_save1());
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFFFA9A9),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _saveGet3();
                          saveFile();
                        },
                        child: Text(
                          '저장',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFFFFA9A9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  // _cate() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         height: 0.6 * MediaQuery.of(context).size.height,
  //       ),
  //       Dialog(
  //         backgroundColor: Colors.transparent,
  //         insetPadding: EdgeInsets.all(1),
  //         child: Container(
  //           width: double.infinity,
  //           height: 150,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Colors.white,
  //           ),
  //           padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Text(
  //                 '카테고리 추가',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 24,
  //                 ),
  //               ),
  //               TextFormField(),
  //               Row(
  //                 children: [
  //                   Text(
  //                     '취소',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 24,
  //                       color: Color(0xFFFFA9A9),
  //                     ),
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       Get.off(
  //                         GetDialog(),
  //                       );
  //                     },
  //                     child: Text(
  //                       '확인',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 24,
  //                         color: Color(0xFFFFA9A9),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  _save3() {
    return Column(
      children: [
        SizedBox(
          height: 0.6 * MediaQuery.of(context).size.height,
        ),
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(1),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '보관함에서 다시 들어볼 수 있어요!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(
                      MainScreen(),
                    );
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFFFFA9A9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
