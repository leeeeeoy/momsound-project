import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keep_keyboard_popup_menu/keep_keyboard_popup_menu.dart';

import '../../getx_controller/record_list_controller.dart';
import '../../screens/recoder_screen.dart';
import 'add_category.dart';
import 'save1.dart';
import 'save3.dart';

save2(BuildContext context1) {
  final controller = Get.put(RecordListController());
  String fileName = '';
  int indexCheck = 0;
  String category = '전체';

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    if (Get.arguments != null) {
      category = Get.arguments;
    }

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
                      fileName = nextText;
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
                GetBuilder<RecordListController>(
                  init: controller,
                  builder: (_) => KeepKeyboardPopupMenuButton(
                    child: Text('$category'),
                    menuItemBuilder: (context, closePopup) =>
                        List<KeepKeyboardPopupMenuItem>.generate(
                      _.category.length,
                      (index) => KeepKeyboardPopupMenuItem(
                          child: index == _.category.length - 1
                              ? GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    Get.dialog(addCategory(context1));
                                  },
                                  child: Text(
                                    '${_.category[index]}',
                                  ),
                                )
                              : ListTile(
                                  leading: indexCheck == index
                                      ? SvgPicture.asset(
                                          'assets/icons/체크박스선택.svg')
                                      : SvgPicture.asset(
                                          'assets/icons/체크박스선택x.svg'),
                                  title: Text('${_.category[index]}'),
                                ),
                          onTap: () {
                            setState(() {
                              indexCheck = index;
                              category = _.category[index];
                            });
                            closePopup();
                          }),
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
                        Get.dialog(save1(context1));
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
                        Get.back();
                        Get.dialog(save3(context1));
                        rs.saveFile(fileName, category);
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
