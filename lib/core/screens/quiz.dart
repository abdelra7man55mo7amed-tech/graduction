
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/backButton.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/onboardingButton.dart';
import 'package:graductaion/core/widgets/primaryOulinebutton.dart';
class Quiz extends StatelessWidget {
  const Quiz({super.key});
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const AuthBackButton(),
            const SizedBox(height: 72),
            Titleauth(
              title: 'quizTitle'.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF111827),
                ),
                children: [
                  TextSpan(text: 'quizDescriptionPart1'.tr()),
                  TextSpan(
                    text: 'aiAssessment'.tr(),
                    style: const TextStyle(
                      color: Color(0xFF4285F4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'quizDescriptionPart2'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: OnboardingPrimaryButton(
                label: 'startQuickAssessment'.tr(),
                onPressed: () {},
                iconData: Icons.auto_awesome,
              ),
            ),
            const SizedBox(height: 16),
            OulinePrimaryButton(
              label: 'remindMeLater'.tr(),
              onPressed: () {},
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}