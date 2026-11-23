import 'package:flutter/material.dart';
class OulinePrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;
  final Widget? child;
  const OulinePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.height,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          side: BorderSide(
            color: Color(0xFF4285F4),
            width: 1
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: child ?? Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4285F4)
          ),
        ),
      ),
    );
  }
}