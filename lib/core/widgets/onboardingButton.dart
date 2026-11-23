import 'package:flutter/material.dart';
class OnboardingPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData iconData;
  const OnboardingPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.iconData
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff015BB1),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              iconData,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}