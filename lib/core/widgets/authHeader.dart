import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AuthHeader extends StatelessWidget {
  final String firstLine;
  final String secondLine;
  final double secondLineSpacing;
  const AuthHeader({
    super.key,
    required this.firstLine,
    required this.secondLine,
    this.secondLineSpacing = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstLine,
          style: GoogleFonts.lakkiReddy(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: const Color(0xff015BB1),
            height: 1.1,
          ),
        ),
        SizedBox(height: secondLineSpacing),
        Text(
          secondLine,
          style: GoogleFonts.lakkiReddy(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: const Color(0xff212121),
            height: 1.2,
          ),
        ),
      ],
    );
  }
}