import 'package:cardiac_rehabilitation/data/add_patient_input.dart';
import 'package:get/get.dart';

class PatientInfoEditLogic extends GetxController {
  var genderFlag = 1.obs; //0女 1男
  var nyhaLevel = 1.obs;

  static PatientInfoEditLogic get to => Get.find();

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
  int status = 0;
  String? clinicalDiagnosis;
  String? medication;
  String? startTime;
  String? hospitalNumber;
  int? bedNo;
  String? endTime;

  List? hospitalDiseaseVos;
  List<String>? drugDuids;

  String? duid;

  var patientNameInput = PatientInputField(
    "患者姓名",
    onContentSave: (content) => PatientInfoEditLogic.to.userName = content,
    checkContent: (content) =>
        content != null && content.isNotEmpty ? null : "姓名不能为空",
    isRequired: true,
  );

  var patientUidInput = PatientInputField(
    "患者Id",
    onContentSave: (content) => PatientInfoEditLogic.to.userName = content,
    checkContent: (content) =>
        content != null && content.isNotEmpty ? null : "ID不能为空",
    isRequired: true,
  );

  var patientBirthdayInput = PatientInputField(
    "出生日期",
    onContentSave: (content) => PatientInfoEditLogic.to.birthday = content,
    checkContent: (content) =>
        content != null && content.isNotEmpty ? null : "出生日期不能为空",
    isRequired: true,
  );

  var patientHeightInput = PatientInputField(
    "身高",
    onContentSave: (content) {},
    checkContent: (content) {},
  );

  var patientWeightInput = PatientInputField(
    "体重",
    onContentSave: (content) {},
    checkContent: (content) {},
  );

  var patientPhoneInput = PatientInputField(
    "联系电话",
    onContentSave: (content) {},
    checkContent: (content) {
      if (content == null) return null;
      return content.isPhoneNumber ? null : "请输入正确的号码格式";
    },
  );

  var patientAddressInput = PatientInputField(
    "居住地",
    onContentSave: (content) {},
    checkContent: (content) {},
  );
}
