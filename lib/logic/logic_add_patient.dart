import 'package:cardiac_rehabilitation/data/add_patient_input.dart';
import 'package:get/get.dart';

class AddPatientLogic extends GetxController {
  var genderFlag = 0.obs; //0女 1男
  var nyhaLevel = 0.obs;

  static AddPatientLogic get to => Get.find();

  void changeFocus(int gender) {
    genderFlag.value = gender;
    update(['genderChoose']);
  }

  void changeNYHALevel(int level) {
    nyhaLevel.value = level;
    update(['nyha_level']);
  }

  String? userName;
  String? uid;

  String? birthday;
  int? height;
  int? weight;
  String? phone;
  String? address;
  int? status;
  String? clinicalDiagnosis;
  String? medication;
  String? startTime;
  String? hospitalNumber;
  int? bedNo;
  String? endTime;

  List? hospitalDiseaseVos;
  List<String>? drugDuids;

  var inputPatientName = AddPatientInputField(
    "患者姓名",
    (content) => AddPatientLogic.to.userName = content,
    (content) => content != null && content.isNotEmpty,
    isRequired: true,
  );

  var inputPatientUid = AddPatientInputField(
    "患者Id",
    (content) => AddPatientLogic.to.userName = content,
    (content) => content != null && content.isNotEmpty,
    isRequired: true,
  );
}
