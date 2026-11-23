import 'package:flutter/material.dart';
class Subtitleauth extends StatelessWidget {
  final String subtitle;
  final TextAlign textAlign;
  const Subtitleauth({super.key, required this.subtitle , required this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign:textAlign,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: Color(0xFF111827),
      ),
    );
  }
}
