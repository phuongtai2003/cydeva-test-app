import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';

class HorizontalDashText extends StatelessWidget {
  const HorizontalDashText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: GlobalColors.greyColor,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
