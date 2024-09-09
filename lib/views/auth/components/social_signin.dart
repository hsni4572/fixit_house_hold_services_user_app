import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

SizedBox socialSignInSection() {
  return SizedBox(
    height: 12.h,
    width: 34.h,
    child: Column(
      children: [
        UiHelpers.appText(
          title: 'Or connect with',
          fSize: 14,
          fColor: const Color(0xff34495E),
        ),
        Sp.y(2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/fb.png',
              scale: .5.h,
            ),
            Sp.x(5),
            Image.asset(
              'assets/logos/google.png',
              scale: .5.h,
            ),
          ],
        )
      ],
    ),
  );
}
