import 'package:fixit/views/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../constants/spacing.dart';
import '../../ui_helpers/ui_helpers.dart';
import 'components/social_signin.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
              Sp.y(5.7),
              UiHelpers.appText(
                title: 'Sign Up',
                fSize: 20,
                fweight: FontWeight.w600,
              ),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: 'Name'),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: 'Email'),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: 'Age'),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: '+972 7875879378'),
              Sp.y(3),
              UiHelpers.inputField(context: context, label: 'Password'),
              Sp.y(3),
              UiHelpers.inputField(
                  context: context, label: 'Re_enter Password'),
              Sp.y(4),
              UiHelpers.appButton(bTitle: 'Sign Up'),
              Sp.y(3.4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelpers.appText(
                    title: 'Already have an account?',
                    fColor: AppColors.black.withOpacity(.6),
                    fSize: 15,
                  ),
                  Sp.x(2),
                  UiHelpers.appText(
                    ontap: () {
                      Get.to(() => const SignInView());
                    },
                    title: 'Sign In',
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
