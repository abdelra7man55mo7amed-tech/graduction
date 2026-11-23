import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/authDivider.dart';
import 'package:graductaion/core/widgets/authHeader.dart';
import 'package:graductaion/core/widgets/authSocial.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeader(firstLine: 'welcome'.tr(), secondLine: 'back'.tr()),
            const SizedBox(height: 38),
            AuthTextField(
              controller: _emailController,
              hint: 'enterEmail'.tr(),
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 26),
            AuthTextField(
              controller: _passwordController,
              hint: 'enterPassword'.tr(),
              icon: Icons.lock_outline,
              obscureText: _obscure,
              suffix: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  _obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 16,
                  color: const Color(0xFF6B6F76),
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () async {
                  await LoadingDialog.show(
                    context: context,
                    message: 'loading'.tr(),
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  if (!context.mounted) return;
                  LoadingDialog.hide(context);
                  context.push(AppRoutes.forgetPassword);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 6),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'forgotPassword'.tr(),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff015BB1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 44),
            PrimaryButton(
              label: 'login'.tr(),
              onPressed: () {},
              backgroundColor: const Color(0xFF4285F4),
              height: 36,
              child: Text(
                'login'.tr(),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const AuthDivider(),
            const SizedBox(height: 14),
            AuthSocialButton(
              label: 'continueWithGoogle'.tr(),
              icon: const FaIcon(
                FontAwesomeIcons.google,
                size: 14,
                color: Color(0xFF4285F4),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AuthSocialButton(
              label: 'continueWithApple'.tr(),
              icon: const FaIcon(
                FontAwesomeIcons.apple,
                size: 16,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 28),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'noAccount'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await LoadingDialog.show(
                        context: context,
                        message: 'loading'.tr(),
                      );
                      await Future.delayed(const Duration(seconds: 1));
                      if (!context.mounted) return;
                      LoadingDialog.hide(context);
                      context.push(AppRoutes.register);
                    },
                    child: Text(
                      'getStarted'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4285F4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
