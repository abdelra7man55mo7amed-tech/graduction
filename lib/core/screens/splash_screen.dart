
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/gradient.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }
Future<void> checkOnboardingStatus() async {
  await Future.delayed(const Duration(seconds: 2));
  if (!mounted) return;
  await LoadingDialog.show(
    context: context,
    message: 'loading'.tr(),
  );
  final prefs = await SharedPreferences.getInstance();
  final bool isCompleted =
      prefs.getBool('onboardingCompleted') ?? false;
  if (!mounted) return;
  await Future.delayed(const Duration(seconds: 1));
  if (!mounted) return;
  LoadingDialog.hide(context);
  if (isCompleted) {
    context.go(AppRoutes.login);
  } else {
    context.go(AppRoutes.onboarding);
  }
}
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/imgs/logo.png',
                width: 184.w,
                height: 170.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 8.h),
              Text(
                'Nexora',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff01498E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}