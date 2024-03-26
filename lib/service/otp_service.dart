import 'package:dio/dio.dart';

class OtpService {
  final Dio _dio = Dio();

  Future<bool> otpVerification({required String otp}) async {
    try {
      final res = await _dio.post(
        'http://103.11.199.134:8001/api/v1/auth/verify/otp/',
        data: {
          'code': otp,
        },
      );
      if (res.data['status_code'] == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
