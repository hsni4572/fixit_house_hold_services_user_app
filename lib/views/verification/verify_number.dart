import 'package:fixit/constants/colors.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/verification/enter_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class VerifyNumberView extends StatelessWidget {
  const VerifyNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sp.y(10),
              UiHelpers.appLogo(color: AppColors.primary, size: .9),
              Sp.y(43),
              UiHelpers.appText(
                  title: 'Verify Your\nPhone Number',
                  fSize: 22,
                  tAlign: TextAlign.start,
                  fweight: FontWeight.w800,
                  height: .13.h),
              Sp.y(2.5),
              UiHelpers.appText(
                title:
                    'Please enter your mobile number below to\nreceive verification code',
                fSize: 16.2,
                tAlign: TextAlign.start,
                fweight: FontWeight.w500,
              ),
              Sp.y(2.5),
              UiHelpers.appText(
                title: 'Mobile Number',
                fSize: 16.8,
                tAlign: TextAlign.start,
                fweight: FontWeight.w500,
              ),
              Sp.y(2.5),
              UiHelpers.inputField(
                context: context,
                padding: 1.3,
                label: '+926 37674534638',
              ),
              Sp.y(3.3),
              UiHelpers.appButton(
                  onTap: () {
                    Get.to(() => const OTPView());
                  },
                  bTitle: 'Send'),
            ],
          ),
        ),
      ),
    );
  }
}
