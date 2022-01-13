import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:cardiac_rehabilitation/network/dio_manager.dart';

//统计预约科室总/余量
Future<List<AppointDep>> getAppointDepList(DateTime date) async {
  var dateString = date.toString().substring(0, 10);
  var result = await DioUtils().getList('/hospital-appointment/dept/count',
      queryParam: {'date': dateString, 'type': 0});
  List<AppointDep> list = (result == null || result.isEmpty)
      ? []
      : result.map((e) => AppointDep.fromJson(e)).toList();
  return list;
}
