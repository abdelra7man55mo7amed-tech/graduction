import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class AuthDivider extends StatelessWidget {
  final double horizontalPadding;
  const AuthDivider({
    super.key,
    this.horizontalPadding = 8,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xff9E9E9E),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: Text(
            "orContinueWith".tr(),
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffA6A6A6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xff9E9E9E),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}