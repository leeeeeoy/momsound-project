import 'package:get/get.dart';
import 'package:momsori/models/test_user.dart';

class UserController extends GetxController {
  TestUser user = TestUser(
    id: 1,
    name: '엄마',
    nickName: '아기',
    babyBirth: '2021-12-31',
  );

  updateUserName(String name, String nickName, String babyBirth) {
    user = user.copyWith(
      name: name,
      nickName: nickName,
      babyBirth: babyBirth,
    );
    update();
  }
}
