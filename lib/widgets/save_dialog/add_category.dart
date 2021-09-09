import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/getx_controller/record_list_controller.dart';
import 'package:momsori/widgets/save_dialog/save_dialog.dart';

addCategory(BuildContext context1) {
  final controller = Get.put(RecordListController());
  String newCategory = '';

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(1),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카테고리 추가',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            TextFormField(
              onChanged: (nextText) {
                setState(() {
                  newCategory = nextText;
                });
              },
            ),
            SizedBox(
              height: 50,
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
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFFFFA9A9),
                    ),
                  ),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Color(0xffdadada),
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.deleteList();
                    controller.addList(newCategory);
                    controller.addList('+ 카테고리 추가');
                    Get.back();
                    Get.dialog(SaveDialog(context1), arguments: newCategory);
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFFFA9A9),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}
