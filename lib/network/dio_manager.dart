import 'package:cardiac_rehabilitation/constants.dart';
import 'package:cardiac_rehabilitation/models/index.dart';
import 'package:dio/dio.dart';

Future<List<ChooseDisease>> getChooseDiseaseList() async {
  var result = await DioUtils().getList('/disease/chooseDisease');
  if (result == null || result == []) {
    return [];
  } else {
    return result.map((e) => ChooseDisease.fromJson(e)).toList();
  }
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

  Future<List<dynamic>?> getList(String path) async {
    var r = await dio.get(path);
    if (r.data["code"] == 200) {
      logger.i("${r.data["code"]} : ${r.data["msg"]}");
    } else {
      logger.w("${r.data["code"]} : ${r.data["msg"]}");
    }
    logger.d("${r.data["data"]}");
    return r.data["data"];
  }
}
