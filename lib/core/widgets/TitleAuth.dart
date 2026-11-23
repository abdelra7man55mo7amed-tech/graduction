import 'package:flutter/material.dart';
class Titleauth extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  const Titleauth({super.key, required this.title , required this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF111827),
      ),
    );
  }
}