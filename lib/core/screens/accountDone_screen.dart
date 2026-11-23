import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/backButton.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/onboardingButton.dart';

class AccountDoneScreen extends StatelessWidget {
  const AccountDoneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AuthBackButton(),
            const SizedBox(height: 40),
            Image.asset("assets/imgs/accountDone.png"),
            const SizedBox(height: 30),
            Titleauth(
              title: 'accountDoneTitle'.tr(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFF111827),
                ),
                children: [
                  TextSpan(text: 'accountDonePart1'.tr()),
                  TextSpan(
                    text: 'accountDoneHighlight'.tr(),
                    style: const TextStyle(
                      color: Color(0xFF4285F4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'accountDonePart2'.tr()),
                ],
              ),
            ),
            const SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: OnboardingPrimaryButton(
                label: 'continueButton'.tr(),
                onPressed: () async {
                  await LoadingDialog.show(
                    context: context,
                    message: 'loading'.tr(),
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  if (!context.mounted) return;
                  LoadingDialog.hide(context);
                  context.go(AppRoutes.interests);
                },
                iconData: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
