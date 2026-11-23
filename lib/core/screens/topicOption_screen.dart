import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/onboardingButton.dart';
import 'package:graductaion/core/widgets/subtitleAuth.dart';
import 'package:graductaion/core/widgets/topicOption.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});
  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> topics = [
    'computerParts',
    'buildingPCs',
    'gamingHardware',
    'networkHardware',
    'futureTechnology',
  ];
  final Set<String> selectedTopics = {'gamingHardware'};
  void toggleTopic(String topic) {
    setState(() {
      if (selectedTopics.contains(topic)) {
        selectedTopics.remove(topic);
      } else {
        selectedTopics.add(topic);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 112),
            Titleauth(title: 'interestsTitle'.tr(), textAlign: TextAlign.start),
            const SizedBox(height: 8),
            Subtitleauth(
              subtitle: 'interestsSubtitle'.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topics.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 7);
                },
                itemBuilder: (context, index) {
                  final topic = topics[index];

                  return TopicOption(
                    title: topic.tr(),
                    isSelected: selectedTopics.contains(topic),
                    onTap: () => toggleTopic(topic),
                  );
                },
              ),
            ),
            const SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: OnboardingPrimaryButton(
                label: 'continueButton'.tr(),
                onPressed: () async {
                  await LoadingDialog.show(
                    context: context,
                    message: 'loading'.tr(),
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  if (!context.mounted) return;
                  LoadingDialog.hide(context);
                  context.push(AppRoutes.learning);
                },
                iconData: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
