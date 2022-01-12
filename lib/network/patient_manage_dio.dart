import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:dio/dio.dart';

import 'dio_manager.dart';

//获取疾病列表
Future<List<ChooseDisease>> getChooseDiseaseList() async {
  var result = await DioUtils().getList('/disease/chooseDisease');
  List<ChooseDisease> list = (result == null || result.isEmpty)
      ? []
      : result.map((e) => ChooseDisease.fromJson(e)).toList();
  return list;
}

//获取药物列表
Future<List<ChooseDrug>> getChooseDrug() async {
  var result = await DioUtils().getList('/drug/chooseDrug');
  List<ChooseDrug> list = (result == null || result.isEmpty)
      ? []
      : result.map((e) => ChooseDrug.fromJson(e)).toList();
  return list;
}

//分页查询患者信息列表
Future<PatientInfoSummary> getPatientList(int pageNum, int pageSize) async {
  var result = await DioUtils().getData('/hospital/selectPage', {
    'pageNum': pageNum,
    'pageSize': pageSize,
  });
  PatientInfoSummary summary = (result == null || result.isEmpty)
      ? PatientInfoSummary()
      : PatientInfoSummary.fromJson(result);
  return summary;
}

//新增患者信息
Future<bool> addOrUpdatePatient({
  required String userName,
  required String uid,
  required int gender,
  required String birthday,
  int? height,
  int? weight,
  String? phone,
  String? address,
  required int status,
  String? clinicalDiagnosis,
  String? medication,
  String? startTime,
  String? hospitalNumber,
  int? bedNo,
  String? endTime,
  int? nyhaLevel,
  List? hospitalDiseaseVos,
  List<String>? drugDuids,
  String? duid,
}) async {
  var result = await DioUtils().postForData(
    duid == null ? '/hospital/add' : '/hospital/update/$duid',
    {
      "address": address,
      "bedNo": bedNo,
      "birthday": birthday,
      "bmi": null,
      "clinicalDiagnosis": clinicalDiagnosis,
      "day": 0,
      "drugDuids": drugDuids,
      "endTime": endTime,
      "evaluateNumber": 0,
      "evaluateTime": null,
      "height": height,
      "hospitalDiseaseVos": hospitalDiseaseVos,
      // {"diseaseDuid": "", "operationTime": ""}
      "hospitalNumber": hospitalNumber,
      "medication": medication,
      "nyha": nyhaLevel,
      "phone": phone,
      "sex": gender,
      "startTime": startTime,
      "state": status,
      "uid": uid,
      "userName": userName,
      "weight": weight
    },
  );
  return result["code"] == 200;
}

//删除患者信息
Future<bool> deletePatient(String duid) async {
  var result = await DioUtils()
      .postForData('/hospital/del', FormData.fromMap({"ids": duid}));
  return result['code'] == 200;
}

//根据duid查询患者详细信息
Future<PatientDetailInfo> getPatientDetailInfo(String duid) async {
  var result = await DioUtils().getData('/hospital/getById', {'duid': duid});
  //logger.i("$result");
  return PatientDetailInfo.fromJson(result);
}
