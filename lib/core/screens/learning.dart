import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/backButton.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/learnSelector.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';
import 'package:graductaion/core/widgets/primaryOulinebutton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';

class LearningGoalScreen extends StatefulWidget {
  const LearningGoalScreen({super.key});

  @override
  State<LearningGoalScreen> createState() => _LearningGoalScreenState();
}

class _LearningGoalScreenState extends State<LearningGoalScreen> {
  int? selectedMinutes;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackButton(),
            const SizedBox(height: 64),
            Titleauth(
              title: 'dailyLearningGoal'.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 8),
            Subtitleauth(
              subtitle: 'learningGoalSubtitle'.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 65),
            LearningGoalSelector(
              selectedMinutes: selectedMinutes,
              onChanged: (value) {
                setState(() {
                  selectedMinutes = value;
                });
              },
            ),
            const SizedBox(height: 60),
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
                context.push(AppRoutes.quiz);
              },
              backgroundColor: const Color(0xFF4285F4),
              height: 40,
              child: Text(
                'continueButton'.tr(),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OulinePrimaryButton(
                label: 'skipForNow'.tr(),
                onPressed: () {},
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
