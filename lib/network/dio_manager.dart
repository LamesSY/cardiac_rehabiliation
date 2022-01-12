import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:dio/dio.dart';

//登录，获得token
Future<String> login(String code, userName, password, uuid) async {
  var result = await DioUtils.dio.post(
    '/login',
    data: {
      "code": code,
      "password": password,
      "username": userName,
      "uuid": uuid
    },
  );
  DioUtils().printNetWorkInfo(result);
  String token = result.data["code"] == 200 ? result.data["token"] : "";
  if (token.isNotEmpty) {
    logger.i(token);
    DioUtils.dio.options.headers['Authorization'] = token;
  }
  return token;
}

//获取图片验证码(base64)
Future<CaptchaImage> getCaptchaImage() async {
  var result = await DioUtils.dio.get('/captchaImage');
  return CaptchaImage.fromJson(result.data);
}

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
  required int nyhaLevel,
  List? hospitalDiseaseVos,
  List<String>? drugDuids,
  String? duid,
}) async {
  var result = await DioUtils().postForData(
    duid == null ? '/hospital/add' : '/hospital/add/$duid',
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

//根据duid查询患者信息
Future<PatientDetailInfo> getPatientDetailInfo(String duid) async {
  var result = await DioUtils().getData('/hospital/getById', {'duid': duid});
  //logger.i("$result");
  return PatientDetailInfo.fromJson(result);
}

class DioUtils {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://120.79.97.39:8899',
      headers: {
        'country': 'CN',
        'deviceFlag': 'g',
        'lang': 'ZH',
        'Authorization':
            'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6ImFhMDFiYTEwLWJjNTctNGM0YS04MWFmLTgyNDAzNmMyZDhmNyJ9.P9ZG_xW1EtoAQpro4SFgCYzQa32GOXePUd075UieQGaiSGtU5QTQ62QTX1Q-1EC80ut78iWjifVmgKSBrbyfOA'
      },
    ),
  );

  Future<dynamic> postForData(String path, dynamic data) async {
    var r = await dio.post(path, data: data);
    printNetWorkInfo(r);
    return r.data;
  }

  Future<List<dynamic>?> getList(String path) async {
    var r = await dio.get(path);
    printNetWorkInfo(r);
    return r.data["data"];
  }

  Future<dynamic> getData(String path, Map<String, dynamic>? queryParam) async {
    var r = await dio.get(path, queryParameters: queryParam);
    printNetWorkInfo(r);
    return r.data["data"];
  }

  void printNetWorkInfo(Response<dynamic> r) {
    if (r.data["code"] == 200) {
      logger.i("code: ${r.data["code"]} \n msg: ${r.data["msg"]}");
    } else {
      logger.w("code: ${r.data["code"]} \n msg: ${r.data["msg"]}");
    }
    logger.d("data: ${r.data["data"]}");
  }
}
