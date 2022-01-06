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
// Future<PatientList> postForPatientList(int pageNum, int pageSize) async {
//   var result = await DioUtils().postForData('/hospital/selectPage',{
//     'pageNum' : pageNum,
//     'pageSize' : pageSize,
//   });
//   PatientList list =

// }

Future<dynamic> addNewPatient({
  String? address,
}) async {
  var rseult = await DioUtils().postForData('/hospital/add', {
    {
      "address": "",
      "bedNo": 0,
      "birthday": "",
      "bmi": "",
      "clinicalDiagnosis": "",
      "day": 0,
      "drugDuids": [],
      "endTime": "",
      "evaluateNumber": 0,
      "evaluateTime": "",
      "height": 0,
      "hospitalDiseaseVos": [
        {"diseaseDuid": "", "operationTime": ""}
      ],
      "hospitalNumber": "",
      "medication": "",
      "nyha": 0,
      "phone": "",
      "sex": 0,
      "startTime": "",
      "state": 0,
      "uid": "",
      "userName": "",
      "weight": 0
    }
  });
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
            'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjIwY2VkMTU3LTkzNzAtNDczYS04M2Q2LWZmNjlhMWY0MjQ2YyJ9.xr4HVdtgB1GEofQuPofWha1lbbUdt9uO4Eghd2cpyM375Rrz4HKuIOW1eS2d3ickCbb8CtTZjjjJ8GXP9a1qwg'
      },
    ),
  );

  Future<dynamic> postForData(String path, dynamic data) async {
    var r = await dio.post(path, data: data);
    printNetWorkInfo(r);
    return r.data["data"];
  }

  Future<List<dynamic>?> getList(String path) async {
    var r = await dio.get(path);
    printNetWorkInfo(r);
    return r.data["data"];
  }

  Future<dynamic> getData(String path) async {
    var r = await dio.get(path);
    printNetWorkInfo(r);
    return r.data["data"];
  }

  void printNetWorkInfo(Response<dynamic> r) {
    if (r.data["code"] == 200) {
      logger.i("${r.data["code"]} : ${r.data["msg"]}");
    } else {
      logger.w("${r.data["code"]} : ${r.data["msg"]}");
    }
    logger.d("${r.data["data"]}");
  }
}
