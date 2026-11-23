import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/backButton.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Timer? timer;
  int remainingSeconds = 10;
  static const Color primaryColor = Color(0xFF0563B9);
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    setState(() {
      remainingSeconds = 10;
      pinController.clear();
    });
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.zero,
      ),
    );
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: const AuthBackButton(),
                ),
                const SizedBox(height: 25),
                Image.asset("assets/imgs/verify.png"),
                const SizedBox(height: 25),
                Titleauth(
                  title: 'verifyEmailAddress'.tr(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Subtitleauth(
                  subtitle: 'verifyEmailSubtitle'.tr(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                Pinput(
                  length: 4,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor, width: 1.5),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length != 4) {
                      return 'completeOtpRequired'.tr();
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  showCursor: true,
                  onCompleted: (value) {
                    debugPrint('OTP: $value');
                  },
                ),
                const SizedBox(height: 35),
                PrimaryButton(
                  label: 'continue'.tr(),
                  onPressed: () async {
                    await LoadingDialog.show(
                      context: context,
                      message: 'loading'.tr(),
                    );
                    await Future.delayed(const Duration(seconds: 1));
                    if (!context.mounted) return;
                    LoadingDialog.hide(context);
                    context.push(AppRoutes.setNewPassword);
                  },
                  backgroundColor: const Color(0xff015BB1),
                  height: 44,
                  child: Text(
                    'continueButton'.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'resendCodeIn'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff111827),
                      ),
                    ),
                    if (remainingSeconds > 0)
                      Text(
                        '0:${remainingSeconds.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: resendCode,
                        child: Text(
                          'resendCode'.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff015BB1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
