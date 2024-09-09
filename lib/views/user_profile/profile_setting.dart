import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/icons.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingView extends StatelessWidget {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: UiHelpers.backButton(),
        title: UiHelpers.appText(
          title: 'Profile Setting',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sp.y(2.5),
              UiHelpers.appText(title: 'Upload Picture', fSize: 15.8),
              Sp.y(2.5),
              Center(
                child: CircleAvatar(
                  radius: 6.5.h,
                  backgroundColor: AppColors.textFieldColor,
                  child: Center(
                    child: Image.asset(
                      FixitIcons.icUploadPicture,
                      scale: .5.h,
                    ),
                  ),
                ),
              ),
              Sp.y(2),
              UiHelpers.appText(title: 'Full Name', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(context: context, label: 'Danyal'),
              Sp.y(2),
              UiHelpers.appText(title: 'Email', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(context: context, label: 'Danyal@gmail.com'),
              Sp.y(2),
              UiHelpers.appText(title: 'Mobile Number', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(context: context, label: '+97273987298739'),
              Sp.y(2),
              UiHelpers.appText(title: 'Current Password', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(
                context: context,
                label: '******',
                hideText: true,
                isPasswordField: true,
              ),
              Sp.y(2),
              UiHelpers.appText(title: 'New Password', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(
                context: context,
                label: '******',
                hideText: true,
                isPasswordField: true,
              ),
              Sp.y(2),
              UiHelpers.appText(title: 'Confirm Password', fSize: 15.8),
              Sp.y(1.2),
              UiHelpers.inputField(
                context: context,
                label: '******',
                hideText: true,
                padding: 0.h,
                isPasswordField: true,
              ),
              Sp.y(1.2),
              UiHelpers.appButton(bTitle: 'Save'),
              Sp.y(1.2),
            ],
          ),
        ),
      ),
    );
  }
}
