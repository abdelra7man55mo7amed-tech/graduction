
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/backButton.dart';
import 'package:graductaion/core/widgets/dialog.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';
import 'package:graductaion/core/widgets/textField.dart';
class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});
  @override
  State<SetNewPasswordScreen> createState() =>
      _SetNewPasswordScreenState();
}
class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
Future<void> _changePassword() async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return CommonDialog (
        title: 'passwordChangedSuccess'.tr(),
        subtitle: 'passwordChangedSubtitle'.tr(),
        buttonText: 'goToLogin'.tr(),
        img: "assets/imgs/success.json",
      );
    },
  );
  if (!mounted) return;
  context.go(AppRoutes.login);
}
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const AuthBackButton(),
            ),
            const SizedBox(height: 54),
            Center(
              child: Column(
                children: [
                  Titleauth(
                    title: 'setNewPassword'.tr(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Subtitleauth(
                    subtitle: 'newPasswordSubtitle'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            AuthTextField(
              controller: _passwordController,
              hint: 'enterPassword'.tr(),
              icon: Icons.lock_outline,
              obscureText: _obscurePassword,
              suffix: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 16,
                  color: const Color(0xff9E9E9E),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 22),
            AuthTextField(
              controller: _confirmPasswordController,
              hint: 'confirmPassword'.tr(),
              icon: Icons.lock_outline,
              obscureText: _obscureConfirmPassword,
              suffix: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 16,
                  color: const Color(0xff9E9E9E),
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword =
                        !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 46),
            PrimaryButton(
              label: 'continue'.tr(),
              onPressed: _changePassword,
              backgroundColor: const Color(0xff015BB1),
              height: 36,
              child: Text(
                'continueButton'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}