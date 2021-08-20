import 'package:get/get.dart';

class RecordListController extends GetxController {
  List<String> category = [
    '카테고리1',
    '카테고리2',
    '카테고리3',
    '카테고리4',
    '카테고리5',
    '카테고리6',
    '카테고리7',
    '카테고리8',
    '카테고리9',
    '카테고리10',
    '+ 카테고리 추가',
  ];

  addList(String newCategory) {
    category.add(newCategory);
    update();
  }

  deleteList() {
    category.removeLast();
    update();
  }
}
