import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.numberOnly = false,
  });
  final TextEditingController controller;
  final String hintText;
  final bool numberOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: numberOnly ? TextInputType.number : TextInputType.text,
      controller: controller,
      style: GoogleFonts.nunito(
        color: GlobalColors.iconColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.nunito(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
