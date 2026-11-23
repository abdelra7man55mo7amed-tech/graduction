
import 'package:easy_localization/easy_localization.dart';
class OnboardingData {
  final String image;
  final String title;
  final String description;
  const OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}
final List<OnboardingData> onboardingPages = [
  OnboardingData(
    image: 'assets/imgs/onboarding1.png',
    title: 'onboardingTitle1'.tr(),
    description: 'onboardingDescription1'.tr(),
  ),
  OnboardingData(
    image: 'assets/imgs/onboarding2.png',
    title: 'onboardingTitle2'.tr(),
    description: 'onboardingDescription2'.tr(),
  ),
  OnboardingData(
    image: 'assets/imgs/onboarding3.png',
    title: 'onboardingTitle3'.tr(),
    description: 'onboardingDescription3'.tr(),
  ),
];