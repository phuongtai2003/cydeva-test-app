import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/global_colors.dart';

class CampWidget extends StatelessWidget {
  const CampWidget({
    super.key,
    this.isSelected = false,
  });
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: GlobalColors.iconColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: isSelected
                  ? const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).copyWith(top: 16)
                  : EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ).copyWith(
                  bottomRight: const Radius.circular(0),
                ),
                child: Image.asset(
                  'assets/images/mountain.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Himalayan mountain peak',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 8,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Himalayan',
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    size: 8,
                    color: GlobalColors.goldColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '4.5',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
