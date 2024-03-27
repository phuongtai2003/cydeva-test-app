import 'package:injectable/injectable.dart';
import 'package:test_app/data_repository/login_data_repository.dart';
import 'package:test_app/models/phone_verification/request/phone_verification_request.dart';

@lazySingleton
class LoginService {
  final LoginDataRepository _loginDataRepository;

  LoginService(this._loginDataRepository);

  Future<bool> checkPhoneNumberExist({required String phoneNum}) async {
    try {
      final res = await _loginDataRepository.login(
        request: PhoneVerificationRequest(phoneNumber: phoneNum),
      );
      if (res.statusCode == 204 || res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print('Hello $e');
      return false;
    }
  }
}
