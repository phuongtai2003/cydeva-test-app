import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/controllers/otp_controller.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/otp_input_text_field.dart';
import 'package:test_app/widgets/return_appbar_btn.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  void _verifyOtp() async {
    final res = await controller.verifyOtp();
    if (res) {
      Get.offAllNamed(RouteGenerator.success);
    } else {
      Get.snackbar(
        'Error',
        'Invalid OTP',
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: ReturnAppBarButton(
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext cntext) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(cntext).size.height - 100,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: _buildHeader(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: _buildOtpRow(cntext),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      int minutes = controller.countDownTimer.value ~/ 60;
                      int seconds = controller.countDownTimer.value % 60;
                      String minutesStr = minutes.toString().padLeft(2, '0');
                      String secondsStr = seconds.toString().padLeft(2, '0');
                      return SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Resend the code after $minutesStr:$secondsStr',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            color: GlobalColors.greyColor,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: CustomButton(
                        buttonColor: GlobalColors.iconColor,
                        text: 'Verify',
                        onPressed: _verifyOtp,
                      ),
                    ),
                    const Spacer(),
                    _buildResendText(cntext),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return Container(
                      color: GlobalColors.greyColor.withOpacity(0.2),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResendText(BuildContext cntext) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: GlobalColors.greyColor,
          ),
          text: 'Didn\'t receive the code? ',
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: 'Resend',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: GlobalColors.iconColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpRow(BuildContext cntext) {
    return Row(
      children: [
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[0],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              }
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[1],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(cntext).previousFocus();
              }
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[2],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(cntext).previousFocus();
              }
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[3],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(cntext).previousFocus();
              }
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[4],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(cntext).previousFocus();
              }
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: OtpInputTextField(
            controller: controller.otpControllers[5],
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(cntext).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(cntext).previousFocus();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OTP Verification',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Enter the verification code we just sent on your email address',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
