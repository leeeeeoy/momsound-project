import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controller/record_list_controller.dart';
import 'save2.dart';

addCategory(BuildContext context1) {
  final controller = Get.put(RecordListController());
  String newCategory = '';

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MediaQuery.of(context).viewInsets.bottom == 0.0
            ? SizedBox(height: 0.5 * MediaQuery.of(context).size.height)
            : Container(),
        Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(1),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '카테고리 추가',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextFormField(
                  onChanged: (nextText) {
                    setState(() {
                      newCategory = nextText;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.dialog(save2(context1));
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
                    InkWell(
                      onTap: () {
                        controller.deleteList();
                        controller.addList(newCategory);
                        controller.addList('+ 카테고리 추가');
                        Get.back();
                        Get.dialog(save2(context1), arguments: newCategory);
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
              ],
            ),
          ),
        ),
      ],
    );
  });
}
