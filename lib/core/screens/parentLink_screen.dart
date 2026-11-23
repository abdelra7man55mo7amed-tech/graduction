import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';
import 'package:graductaion/core/widgets/textField.dart';

class ParentlinkScreen extends StatefulWidget {
  const ParentlinkScreen({super.key});
  @override
  State<ParentlinkScreen> createState() => _ParentlinkScreenState();
}

class _ParentlinkScreenState extends State<ParentlinkScreen> {
  final _parentCode = TextEditingController();
  @override
  void dispose() {
    _parentCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 140),
            Center(
              child: Column(
                children: [
                  Titleauth(
                    title: 'linkParentAccount'.tr(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Subtitleauth(
                    subtitle: 'parentAccountSubtitle'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            AuthTextField(
              controller: _parentCode,
              hint: 'enterParentCode'.tr(),
              icon: Icons.key,
            ),
            const SizedBox(height: 75),
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
                context.push(AppRoutes.varifyParent);
              },
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
