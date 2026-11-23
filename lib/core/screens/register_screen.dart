import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/authDivider.dart';
import 'package:graductaion/core/widgets/authHeader.dart';
import 'package:graductaion/core/widgets/authSocial.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/textField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;
  String? _age;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            AuthHeader(
              firstLine: 'letsGet'.tr(),
              secondLine: 'started'.tr(),
              secondLineSpacing: 4,
            ),
            const SizedBox(height: 38),
            AuthTextField(
              controller: _nameController,
              hint: 'enterName'.tr(),
              icon: Icons.person_add_alt_1_outlined,
            ),
            const SizedBox(height: 18),
            DropdownButtonFormField<String>(
              value: _age,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Color(0xffA6A6A6),
              ),
              hint: Text(
                'age'.tr(),
                style: const TextStyle(color: Color(0xffA6A6A6), fontSize: 13),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Color(0xffA6A6A6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Color(0xff015BB1)),
                ),
              ),
              items: List.generate(
                83,
                (i) => DropdownMenuItem(
                  value: '${i + 18}',
                  child: Text(
                    '${i + 18}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
              onChanged: (v) => setState(() => _age = v),
            ),
            const SizedBox(height: 18),
            AuthTextField(
              controller: _emailController,
              hint: 'enterEmail'.tr(),
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 18),
            AuthTextField(
              controller: _passwordController,
              hint: 'enterPassword'.tr(),
              icon: Icons.lock_outline,
              obscureText: _obscure,
              suffix: IconButton(
                icon: Icon(
                  _obscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 18,
                  color: const Color(0xffA6A6A6),
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              label: 'signUp'.tr(),
              onPressed: () async {
                await LoadingDialog.show(
                  context: context,
                  message: 'loading'.tr(),
                );
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                LoadingDialog.hide(context);
                context.push(AppRoutes.parentLink);
              },
              backgroundColor: const Color(0xff015BB1),
              height: 44,
              child: Text(
                'signUp'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 28),
            const AuthDivider(horizontalPadding: 10),
            const SizedBox(height: 10),
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}