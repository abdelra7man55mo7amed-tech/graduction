import 'package:flutter/material.dart';
class OnboardingDotsIndicator extends StatelessWidget {
  final int count;
  final int index;
  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 4),
          width: active ? 28 : 18,
          height: 4,
          decoration: BoxDecoration(
            color: active
                ? const Color(0xff015BB1)
                : const Color(0xffCCDEEF),
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}