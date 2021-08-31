import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/record_state_controller.dart';
import '../../screens/main_screen.dart';

save3(BuildContext context) {
  final recordStateController = Get.put(RecordStateController());

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
                  recordStateController.changePrepareRecord();
                  Get.offAll(
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
