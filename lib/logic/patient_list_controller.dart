import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/models/patient_info_ummary.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';
import 'package:get/get.dart';

class PatientListLogic extends GetxController {
  static PatientListLogic get to => Get.find();

  var summary = PatientInfoSummary().obs;
  var currentPage = 1;

  @override
  void onInit() async {
    var sum = await getPatientList(1, 10);
    summary.value = sum;
    super.onInit();
  }

  void refreshPatientList(PatientInfoSummary infoSum) =>
      summary.value = infoSum;

  void refreshList(int page, {int size = 10}) async {
    var sum = await getPatientList(page, size);
    summary.value = sum;
    currentPage = page;
    logger.i("currentPage = $currentPage");
  }
}
