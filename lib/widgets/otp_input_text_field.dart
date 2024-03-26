import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';

class OtpInputTextField extends StatelessWidget {
  const OtpInputTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: GlobalColors.iconColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: GlobalColors.greyColor,
            width: 1,
          ),
        ),
        hintText: '0',
        hintStyle: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: GlobalColors.greyColor,
        ),
      ),
    );
  }
}
