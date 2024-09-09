import 'package:fixit/constants/colors.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/auth/components/social_signin.dart';
import 'package:fixit/views/auth/sign_up.dart';
import 'package:fixit/views/main/main_navigation_view.dart';
import 'package:fixit/views/verification/verify_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
              Sp.y(4),
              Center(
                child: Image.asset(
                  'assets/images/sign in.png',
                  scale: .5.h,
                ),
              ),
              Sp.y(2.5),
              UiHelpers.appText(
                title: 'Sign In',
                fSize: 20,
                fweight: FontWeight.w600,
              ),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: 'UserName'),
              Sp.y(3.5),
              UiHelpers.inputField(context: context, label: 'Password'),
              Sp.y(5.2),
              UiHelpers.appButton(
                  onTap: () {
                    Get.offAll(() => const MainNavigationView());
                  },
                  bTitle: 'Sign In'),
              Sp.y(1.2),
              Padding(
                padding: EdgeInsets.only(left: 60.w),
                child: UiHelpers.appText(
                  ontap: () {
                    Get.to(() => const VerifyNumberView());
                  },
                  title: 'Forgot Password?',
                  fColor: AppColors.black.withOpacity(.6),
                  fSize: 15,
                ),
              ),
              Sp.y(2.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelpers.appText(
                    title: 'Dont have account?',
                    fColor: AppColors.black.withOpacity(.6),
                    fSize: 15,
                  ),
                  Sp.x(2),
                  UiHelpers.appText(
                    ontap: () {
                      Get.to(() => const SignUpView());
                    },
                    title: 'Sign Up',
                    fSize: 15,
                    fweight: FontWeight.w700,
                    fColor: AppColors.primary,
                  ),
                ],
              ),
              Sp.y(2),
              Center(child: socialSignInSection()),
            ],
          ),
        ),
      ),
    );
  }
}
