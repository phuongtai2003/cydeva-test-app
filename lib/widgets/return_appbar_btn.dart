import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';

class ReturnAppBarButton extends StatelessWidget {
  const ReturnAppBarButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: GlobalColors.greyColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              'Back',
              style: GoogleFonts.nunito(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
