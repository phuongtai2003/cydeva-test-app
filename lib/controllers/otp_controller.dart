import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
  final RxInt countDownTimer = 180.obs;
  final RxBool isLoading = false.obs;

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
}
