import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/onboardingButton.dart';
import 'package:graductaion/core/widgets/onboardingData.dart';
import 'package:graductaion/core/widgets/onboardingPage.dart';
import 'package:graductaion/core/widgets/onboarding_dont.dart';
import 'package:graductaion/core/widgets/skipButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingScreen extends StatefulWidget {
  final VoidCallback? onFinished;
  const OnboardingScreen({super.key, this.onFinished});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool get _isLast => _currentPage == onboardingPages.length - 1;
  void _next() {
    if (_isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }
Future<void> _finish() async {
  await LoadingDialog.show(
    context: context,
    message: 'loading'.tr(),
  );
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboardingCompleted', true);
  if (!mounted) return;
  await Future.delayed(const Duration(seconds: 1));
  if (!mounted) return;
  LoadingDialog.hide(context);
  context.go(AppRoutes.language);
}
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(data: onboardingPages[index]);
            },
          ),
          if (!_isLast)
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, right: 20),
                  child: OnboardingSkipButton(onPressed: _finish),
                ),
              ),
            ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingDotsIndicator(
                      count: onboardingPages.length,
                      index: _currentPage,
                    ),
                    OnboardingPrimaryButton(
                      label: _isLast ? 'getStarted'.tr() : 'continueButton'.tr(),
                      onPressed: _next,
                      iconData: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}