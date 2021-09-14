import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keep_keyboard_popup_menu/keep_keyboard_popup_menu.dart';
import 'package:momsori/getx_controller/file_name_controller.dart';
import 'package:momsori/getx_controller/record_list_controller.dart';
import 'package:momsori/screens/main_screen.dart';
import 'package:momsori/widgets/save_dialog/add_category.dart';

Widget saveDialog(BuildContext context) {
  final controller = Get.put<RecordListController>(RecordListController());
  final fileNameController = Get.put<FileNameController>(FileNameController());

  if (Get.arguments != null) {
    controller.changeCategory(Get.arguments);
  }

  return Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.all(1),
    child: Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '녹음 파일 저장',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          TextFormField(
            onChanged: (nextText) {
              fileNameController.changeFileName(nextText);
            },
            cursorColor: Color(0xffa9a9),
          ),
          SizedBox(
            height: 40,
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
            builder: (_) => WithKeepKeyboardPopupMenu(
              childBuilder: ((context, openPopup) {
                return InkWell(
                  onTap: openPopup,
                  child: Text(
                    '${controller.category}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
              backgroundBuilder: (context, child) => Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                shadowColor: Colors.grey,
                child: child,
              ),
              menuItemBuilder: (context, closePopup) =>
                  List<KeepKeyboardPopupMenuItem>.generate(
                _.categories.length,
                (index) => KeepKeyboardPopupMenuItem(
                    height: 35,
                    child: index == _.categories.length - 1
                        ? GestureDetector(
                            onTap: () {
                              closePopup();
                              Get.dialog(addCategory(context));
                            },
                            child: Center(
                              child: Text(
                                '${_.categories[index]}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                controller.categoryIndex == index
                                    ? SvgPicture.asset(
                                        'assets/icons/체크박스선택.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/체크박스선택x.svg'),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '${_.categories[index]}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    onTap: () {
                      controller.changeIndex(index);
                      controller.changeCategory(controller.categories[index]);
                      closePopup();
                    }),
              ),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFFFFA9A9),
                  ),
                ),
              ),
              Text(
                '|',
                style: TextStyle(
                  color: Color(0xffdadada),
                  fontSize: 24,
                ),
              ),
              InkWell(
                onTap: () {
                  // rs.saveFile(
                  //     fileNameController.fileName.value, controller.category);
                  Get.back();
                  Get.snackbar(
                    '저장되었습니다!',
                    '탭하면 보관함으로 이동',
                    snackPosition: SnackPosition.BOTTOM,
                    onTap: (_) {
                      Get.offAll(
                        () => MainScreen(),
                        arguments: 2,
                      );
                    },
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    overlayBlur: 3.0,
                  );
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
  );
}
