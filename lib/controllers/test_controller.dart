import 'package:get/get.dart';

class BoolController extends GetxController {
  var genderFlag = "男".obs;
  void changeFocus(String gender) {
    genderFlag.value = gender;
  }
}
