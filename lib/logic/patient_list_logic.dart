import 'package:cardiac_rehabilitation/network/patient_manage_dio.dart';
import 'package:cardiac_rehabilitation/pages/patient_manage/patient_manage_state.dart';
import 'package:get/get.dart';

class PatientListLogic extends GetxController {
  static PatientListLogic get to => Get.find();
  final PatientManageState state = PatientManageState();

  @override
  void onReady() async {
    refreshList(1);
    super.onReady();
  }

  void refreshList(int page, {int size = 10}) async {
    var sum = await getPatientList(
      page,
      size,
      disease: state.disease,
      fieldIndex: state.fieldIndex,
      phone: state.phone,
      startDate: state.startDate,
      state: state.status,
      uid: state.uid,
      userName: state.userName,
    );
    state.patientSummary = sum;
    state.currentPage = page;
    state.pages = sum.pages?.toInt() ?? 1;
    update();
  }

  //需要添加判断删除的数据是否是当前页唯一数据
  void deleteItem(String duid) async {
    var result = await deletePatient(duid);
    if (!result) return;
    refreshList(state.currentPage);
  }
}
