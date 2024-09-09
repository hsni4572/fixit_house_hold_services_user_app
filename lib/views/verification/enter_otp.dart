import 'package:fixit/constants/colors.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/verification/create_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

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
              Sp.y(36.7),
              UiHelpers.appText(
                  title: 'Verify Your\nPhone Number',
                  fSize: 22,
                  tAlign: TextAlign.start,
                  fweight: FontWeight.w800,
                  height: .13.h),
              Sp.y(2.5),
              UiHelpers.appText(
                title:
                    'A 4-Digit PIN has been sent to your mobile\nnumber. Enter it below to continue',
                fSize: 16.2,
                tAlign: TextAlign.start,
                fweight: FontWeight.w500,
              ),
              Sp.y(2.1),
              UiHelpers.appText(
                title: 'Sent to +965 3368268376',
                fSize: 16,
                tAlign: TextAlign.start,
                fweight: FontWeight.w600,
              ),
              Sp.y(2.5),
              SizedBox(
                height: 5.h,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Numeric_Text_Field(),
                    Numeric_Text_Field(),
                    Numeric_Text_Field(),
                    Numeric_Text_Field(),
                    // Expanded(
                    //   child: UiHelpers.inputField(context: context, label: '0'),
                    // ),
                    // Expanded(
                    //   child: UiHelpers.inputField(context: context, label: '0'),
                    // ),
                    // Expanded(
                    //   child: UiHelpers.inputField(context: context, label: '0'),
                    // ),
                    // Expanded(
                    //   child: UiHelpers.inputField(context: context, label: '0'),
                    // ),
                  ],
                ),
              ),
              Sp.y(3.5),
              UiHelpers.appButton(
                onTap: () {
                  Get.to(() => const CreatePasswordView());
                },
                bTitle: 'Verify',
              ),
              Sp.y(5.5),
              Row(
                children: [
                  UiHelpers.appText(
                    title: "I didn't receive a code",
                    fSize: 16,
                    fweight: FontWeight.w400,
                  ),
                  const Spacer(),
                  UiHelpers.appText(
                    title: "Resend",
                    fSize: 16.5,
                    fweight: FontWeight.w600,
                    fColor: AppColors.primary,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Numeric_Text_Field extends StatelessWidget {
  const Numeric_Text_Field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .17.h,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: TextFormField(
          style: TextStyle(
              color: AppColors.tGrey,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp),
          onChanged: (value) {
            value.length == 1
                ? FocusScope.of(context).nextFocus()
                : FocusScope.of(context).previousFocus();
          },
          decoration: InputDecoration(
              fillColor: AppColors.homeGrey,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 3.1.w, horizontal: 4.w),

              // hintStyle: TextStyle(color: green)
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(50)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(50))),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
