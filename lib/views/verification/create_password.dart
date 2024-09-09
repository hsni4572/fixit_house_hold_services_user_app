import 'package:fixit/constants/colors.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

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
              Sp.y(35),
              UiHelpers.appText(
                  title: 'Create Your\nNew Password',
                  fSize: 22,
                  tAlign: TextAlign.start,
                  fweight: FontWeight.w800,
                  height: .13.h),
              Sp.y(2.8),
              UiHelpers.appText(
                title: 'Password',
                fSize: 16.2,
                tAlign: TextAlign.start,
                fweight: FontWeight.w500,
              ),
              Sp.y(2),
              UiHelpers.inputField(
                context: context,
                padding: 1.3,
                label: '********',
                isPasswordField: true,
              ),
              Sp.y(2),
              UiHelpers.appText(
                title: 'Confirm Password',
                fSize: 16.2,
                tAlign: TextAlign.start,
                fweight: FontWeight.w500,
              ),
              Sp.y(2),
              UiHelpers.inputField(
                context: context,
                padding: 1.3,
                label: '********',
                isPasswordField: true,
                // hideText: true,
              ),
              Sp.y(6),
              UiHelpers.appButton(
                  onTap: () {
                    Get.to(() => const SignInView());
                  },
                  bTitle: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
