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
  DioUtils().printNetWorkInfo("post-$code", result);
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

class DioUtils {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://120.79.97.39:8899',
      headers: {
        'country': 'CN',
        'deviceFlag': 'g',
        'lang': 'ZH',
        'Authorization':
            'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc1NjYxYjk5LTE5NTgtNGIxYi1hMzk0LTE3MzZlYjhmOGUxZCJ9.BPJ93RSNn-oi7zRp-SxlFSJl1tkzylBBGN1zdOJvclGmXx4Wa5V4yZhIrsZfFsife5A4wBFjGbJjgTQGypoCQg'
      },
    ),
  );

  Future<dynamic> postForData(String path, dynamic data) async {
    var r = await dio.post(path, data: data);
    printNetWorkInfo("PSOT: $path", r, queryParam: data);
    return r.data;
  }

  Future<List<dynamic>?> getList(String path) async {
    var r = await dio.get(path);
    printNetWorkInfo("GET: $path", r);
    return r.data["data"];
  }

  Future<dynamic> getData(String path, Map<String, dynamic>? queryParam) async {
    var r = await dio.get(path, queryParameters: queryParam);
    printNetWorkInfo("GET: $path", r, queryParam: queryParam);
    return r.data["data"];
  }

  void printNetWorkInfo(String api, Response<dynamic> r, {dynamic queryParam}) {
    var logInfo =
        "$api\nqueryParam: $queryParam\ncode: ${r.data["code"]} \nmsg: ${r.data["msg"]} \ndata: ${r.data["data"]}";
    r.data["code"] == 200 ? logger.i(logInfo) : logger.e(logInfo);
  }
}
