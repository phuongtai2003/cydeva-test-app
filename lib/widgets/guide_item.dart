import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideItem extends StatelessWidget {
  const GuideItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.isImageOnly = false,
  });
  final Image image;
  final String title;
  final String description;
  final bool isImageOnly;
  @override
  Widget build(BuildContext context) {
    return isImageOnly
        ? Stack(
            children: [
              IntrinsicHeight(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: image,
              ),
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
