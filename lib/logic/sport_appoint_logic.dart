import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/appoint_manage_dio.dart';
import 'package:get/get.dart';

class SportAppointLogic extends GetxController {
  static SportAppointLogic get to => Get.find();

  var depList = List<AppointDep>.empty().obs;

  @override
  void onInit() async {
    var list = await getAppointDepList(DateTime.now());
    depList.value = list;
    update(['sportAppointDep']);
    super.onInit();
  }
}
