import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/patient_manage_dio.dart';
import 'package:get/get.dart';

class PatientUpdateLogic extends GetxController {
  static PatientUpdateLogic get to => Get.find();

  final _detailInfo = PatientDetailInfo().obs;

  void refreshDetailInfo(String duid) async {
    var info = await getPatientDetailInfo(duid);
    _detailInfo.value = info;
  }
}
