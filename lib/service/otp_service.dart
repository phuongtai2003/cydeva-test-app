import 'package:injectable/injectable.dart';
import 'package:test_app/data_repository/login_data_repository.dart';
import 'package:test_app/models/otp_verification/request/otp_verification_request.dart';

@lazySingleton
class OtpService {
  final LoginDataRepository _loginDataRepository;

  OtpService(this._loginDataRepository);

  Future<bool> otpVerification({required String otp}) async {
    try {
      final res = await _loginDataRepository.verifyOTP(
        request: OtpVerificationRequest(code: otp),
      );
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
