import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  const OnboardingSkipButton({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'skip'.tr(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}