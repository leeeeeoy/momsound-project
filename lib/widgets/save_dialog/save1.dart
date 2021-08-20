import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/widgets/save_dialog/save2.dart';

save1(BuildContext context) {
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
                      Get.back();
                      Get.dialog(save2(context));
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
