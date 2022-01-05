import 'package:cardiac_rehabilitation/model/responsive.dart';
import 'package:dio/dio.dart';

// Future<ResponseX> getDiseaseListX() async {
//   var r = await DioUtils.dio.get('/disease/chooseDisease');
//   //return ResponseX.fromJson(r.data);
// }

class DioUtils {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://120.79.97.39:8899',
      headers: {
        'country': 'CN',
        'deviceFlag': 'g',
        'lang': 'ZH',
        'Authorization':
            'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjUyZjA3N2UyLTE1YmQtNDgyNS1hZjdlLWIzMzE1YzIyMzRlMyJ9.UClQFiZgb_kZKdmqJXZmwz2GbwfF1Ttnm9dMJycZKTiD99Vogcqwqg4FaFGg9s9XEA3fK9jGjyiL0VI_vZsXcA'
      },
    ),
  );
}
