import 'package:get/get.dart';

class RecordTimeController extends GetxController {
  RxString recordTime = '00:00'.obs;

  updateRecordTime(String newRecordTime) => recordTime.value = newRecordTime;

  resetRecordTime() => recordTime.value = '00:00';
}
