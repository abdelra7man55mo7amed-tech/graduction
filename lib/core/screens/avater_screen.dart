import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graductaion/core/constant/Approute.dart';
import 'package:graductaion/core/widgets/TitleAuth.dart';
import 'package:graductaion/core/widgets/gradient.dart';
import 'package:graductaion/core/widgets/loading.dart';
import 'package:graductaion/core/widgets/primaryButton.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({super.key});
  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  int selectedAvatar = 0;
  final List<String> avatars = [
    'assets/imgs/avatar1.png',
    'assets/imgs/avatar2.png',
    'assets/imgs/avatar3.png',
    'assets/imgs/avatar4.png',
    'assets/imgs/avatar5.png',
    'assets/imgs/avatar6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 84),
            Titleauth(
              title: 'chooseYourAvatar'.tr(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: avatars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatar = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(avatars[index], fit: BoxFit.contain),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 48),
            PrimaryButton(
              label: 'Set avatar',
              onPressed: () async {
                await LoadingDialog.show(
                  context: context,
                  message: 'loading'.tr(),
                );
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                LoadingDialog.hide(context);
                context.push(AppRoutes.accountDone);
              },
              backgroundColor: const Color(0xff015BB1),
              height: 36,
              child: Text(
                'setAvatar'.tr(),
                style: TextStyle(
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
