import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/primaryOulinebutton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';

class VerifyparentScreen extends StatefulWidget {
  const VerifyparentScreen({super.key});
  @override
  State<VerifyparentScreen> createState() => _VerifyparentScreenState();
}

class _VerifyparentScreenState extends State<VerifyparentScreen> {
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
                    title: 'isThisYourParentAccount'.tr(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Subtitleauth(
                    subtitle: 'confirmParentAccount'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(child: Image.asset("assets/imgs/verfyParent.png")),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Mohamed Ali",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                "mohamedali4@gmail.com",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const SizedBox(height: 64),
            Row(
              children: [
                Expanded(
                  child: OulinePrimaryButton(
                    label: 'no'.tr(),
                    onPressed: () {},
                    height: 40,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    label: "yes".tr(),
                    onPressed: () async {
                      await LoadingDialog.show(
                        context: context,
                        message: 'loading'.tr(),
                      );
                      await Future.delayed(const Duration(seconds: 1));
                      if (!context.mounted) return;
                      LoadingDialog.hide(context);
                      context.push(AppRoutes.avatar);
                    },
                    backgroundColor: Color(0xff015BB1),
                    height: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
