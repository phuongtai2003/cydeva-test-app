import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';
import 'package:test_app/route_generator.dart';
import 'package:test_app/widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext cntext) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 120,
            ).copyWith(
              top: 160,
              bottom: 16,
            ),
            child: SvgPicture.asset(
              'assets/images/success.svg',
              width: 100,
              height: 100,
            ),
          ),
          Text(
            'You have successfully registered',
            style: GoogleFonts.nunito(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Wish you have wonderful expeditions',
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 170,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              buttonColor: GlobalColors.iconColor,
              text: 'Confirm',
              onPressed: () {
                Get.offAllNamed(RouteGenerator.main);
              },
            ),
          ),
        ],
      ),
    );
  }
}
