import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/controllers/login_controller.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';
import 'package:test_app/service/login_service.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_form_field.dart';
import 'package:test_app/widgets/horizontal_dash_text.dart';
import 'package:test_app/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService _loginService = LoginService();
  final TextEditingController _phoneNumController = TextEditingController();
  final LoginController _loginController = Get.put(LoginController());

  @override
  void dispose() {
    super.dispose();
    _phoneNumController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(child: _buildBody(context));
  }

  Widget _buildBody(BuildContext cntext) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(cntext).size.height - 40,
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
                        ).copyWith(
                          bottom: 40,
                          top: 80,
                        ),
                        child: Text(
                          'Welcome back! Glad to see you, Again!',
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Enter your phone number',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: CustomTextFormField(
                          controller: _phoneNumController,
                          numberOnly: true,
                          hintText: 'Phone Number',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: CustomButton(
                          onPressed: () async {
                            _loginController.isLoading.value = true;
                            final phoneNum = _phoneNumController.text;
                            final value = await _loginService
                                .checkPhoneNumberExist(phoneNum: phoneNum);
                            if (value) {
                              Get.toNamed(RouteGenerator.otp);
                            } else {
                              Get.snackbar('Error', 'Phone number not found');
                            }
                            _loginController.isLoading.value = false;
                          },
                          buttonColor: GlobalColors.iconColor,
                          text: 'Login',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 24,
                        ),
                        child: HorizontalDashText(
                          text: 'Or Login with',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: _buildSocialButtons(cntext),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildRegisterNowRow(cntext),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    if (_loginController.isLoading.value) {
                      return Positioned.fill(
                        child: Container(
                          color: GlobalColors.greyColor.withOpacity(0.2),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> socialButtons = [
    SocialButton(
      onPressed: () {},
      image: SvgPicture.asset(
        'assets/images/facebook_ic.svg',
      ),
    ),
    SocialButton(
      onPressed: () {},
      image: SvgPicture.asset(
        'assets/images/google_ic.svg',
      ),
    ),
    SocialButton(
      onPressed: () {},
      image: SvgPicture.asset(
        'assets/images/cib_apple.svg',
      ),
    ),
  ];

  Widget _buildSocialButtons(BuildContext cntext) {
    return Row(
      children: [
        Expanded(child: socialButtons[0]),
        const SizedBox(
          width: 8,
        ),
        Expanded(child: socialButtons[1]),
        const SizedBox(
          width: 8,
        ),
        Expanded(child: socialButtons[2]),
      ],
    );
  }

  Widget _buildRegisterNowRow(BuildContext cntext) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: GlobalColors.greyColor,
          ),
          text: 'Don\'t have an account? ',
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: 'Register Now',
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
}
