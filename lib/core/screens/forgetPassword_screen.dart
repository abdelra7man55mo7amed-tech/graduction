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
import 'package:graductaion/core/widgets/textField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            AuthBackButton(),
            const SizedBox(height: 32),
            Center(child: Image.asset("assets/imgs/forgetpassword.png")),
            const SizedBox(height: 24),
            Center(
              child: Titleauth(
                title: 'forgotPassword'.tr(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Subtitleauth(
                subtitle: 'forgotPasswordSubtitle'.tr(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            AuthTextField(
              controller: _emailController,
              hint: 'enterEmail'.tr(),
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),
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
                context.push(AppRoutes.varifyEmailScreen);
              },
              backgroundColor: const Color(0xff015BB1),
              height: 42,
              child: Text(
                'continueButton'.tr(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
