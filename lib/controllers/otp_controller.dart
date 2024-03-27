import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/service/otp_service.dart';

class OtpController extends GetxController {
  final RxInt countDownTimer = 180.obs;
  final RxBool isLoading = false.obs;
  final OtpService _otpService;
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  OtpController(this._otpService);

  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  void countDown() {
    const countdownTimer = Duration(seconds: 1);
    Timer.periodic(
      countdownTimer,
      (timer) {
        if (countDownTimer.value == 0) {
          timer.cancel();
        } else {
          countDownTimer.value--;
        }
      },
    );
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }

  Future<bool> verifyOtp() async {
    final otp = otpControllers.fold<String>(
      '',
      (previousValue, element) => previousValue + element.text,
    );
    setLoading(true);
    final res = await _otpService.otpVerification(otp: otp);
    setLoading(false);
    return res;
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
  }
}
