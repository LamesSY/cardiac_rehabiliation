import 'package:get/get.dart';

class BoolController extends GetxController {
  var genderFlag = "男".obs;
  var nyhaLevel = 0.obs;

  void changeFocus(String gender) {
    genderFlag.value = gender;
    update(['genderChoose']);
  }

  void changeNYHALevel(int level) {
    nyhaLevel.value = level;
    update(['nyha_level']);
  }

  var userName = "赵六";
  var uid = "99123";
  var gender = 1;
  var birthday = "2001-01-02";
  var status = 2;
  var nyha = 1;
}
