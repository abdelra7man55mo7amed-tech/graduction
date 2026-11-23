import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/langCard.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/onboardingButton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Titleauth(
              title: 'selectLanguage'.tr(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Subtitleauth(
              subtitle: 'languageSubtitle'.tr(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            Row(
              children: [
                Expanded(
                  child: LanguageCard(
                    title: 'english'.tr(),
                    subtitle: 'english'.tr(),
                    symbol: 'Aa',
                    isSelected: context.locale.languageCode == 'en',
                    onTap: () {
                      context.setLocale(const Locale('en'));
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: LanguageCard(
                    title: 'العربية',
                    subtitle: 'arabic'.tr(),
                    symbol: 'أي',
                    isSelected: context.locale.languageCode == 'ar',
                    onTap: () {
                      context.setLocale(const Locale('ar'));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            OnboardingPrimaryButton(
              label: 'next'.tr(),
              onPressed: () async {
                await LoadingDialog.show(
                  context: context,
                  message: 'loading'.tr(),
                );
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                LoadingDialog.hide(context);
                context.go(AppRoutes.login);
              },
              iconData: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
