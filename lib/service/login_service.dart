import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<bool> checkPhoneNumberExist({required String phoneNum}) async {
    try {
      String num = "+84${phoneNum.substring(1)}";

      final res = await _dio.post(
        'http://103.11.199.134:8001/api/v1/auth/user/check/exist/',
        data: {
          'phone_number': num,
        },
      );
      if (res.data['status_code'] == 204 || res.data['status_code'] == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
