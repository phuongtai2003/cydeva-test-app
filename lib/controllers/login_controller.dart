import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/service/login_service.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final LoginService _loginService;
  final TextEditingController phoneNumController = TextEditingController();

  LoginController(this._loginService);

  void setLoading(bool value) {
    isLoading.value = value;
  }

  Future<bool> login() async {
    final number = phoneNumController.text;
    setLoading(true);
    String num = "+84${number.substring(1)}";

    final value = await _loginService.checkPhoneNumberExist(phoneNum: num);
    setLoading(false);
    if (value) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumController.dispose();
  }
}
