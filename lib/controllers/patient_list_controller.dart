import 'package:cardiac_rehabilitation/models/patient_info_ummary.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';
import 'package:get/get.dart';

class PatientListController extends GetxController {
  var summary = PatientInfoSummary().obs;

  @override
  void onInit() async {
    var sum = await getPatientList(1, 10);
    summary.value = sum ?? PatientInfoSummary();
    super.onInit();
  }

  void refreshPatientList(PatientInfoSummary infoSum) =>
      summary.value = infoSum;
}
