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
            'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjcxNTU2ZjM0LTAzMWUtNDQ0ZC04M2I4LWE3NjI2ZTA1MGZiNyJ9.j_PtrrrpHUxFhr_nvZGtZnIXYMCr03onO5Xoyxxb36_vgnuYe_mFIVV872kxcajEX4V6I4p3DqfULofQF8yv3Q'
      },
    ),
  );
}
