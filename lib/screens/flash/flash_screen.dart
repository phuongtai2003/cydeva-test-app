import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(
      () => Get.offNamed(RouteGenerator.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/images/app_icon.svg',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20),
              Text(
                'Loading...',
                style: GoogleFonts.nunito(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: GlobalColors.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
