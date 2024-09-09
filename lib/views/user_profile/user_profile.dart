import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/icons.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/auth/sign_in.dart';
import 'package:fixit/views/user_profile/block_list.dart';
import 'package:fixit/views/contracts/contracts.dart';
import 'package:fixit/views/user_profile/languages.dart';
import 'package:fixit/views/user_profile/profile_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

// ignore: must_be_immutable
class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool isEnabled = false;
  List<String> settingTileName = [
    'Profile Setting',
    'Notifications',
    'Block List',
    'Contracts',
    'Language',
    'HelpLine',
    'Privacy Policy',
    'Log out',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: UiHelpers.appText(
          title: 'Side Profile',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Sp.y(2),
            CircleAvatar(
              radius: 6.3.h,
              backgroundImage: const NetworkImage(
                'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
              ),
            ),
            Sp.y(1.5),
            // NAME TEXT
            UiHelpers.appText(
              title: 'Dianne Russell',
              fSize: 16,
              fweight: FontWeight.w600,
            ),
            // EMAIL TEXT
            UiHelpers.appText(
              title: 'danyal@gmail.com',
              fweight: FontWeight.w400,
              fSize: 14.8,
              fColor: const Color(0xff8593A8),
            ),
            Sp.y(2.5),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: settingTileName.length,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => const ProfileSettingView());
                        } else if (index == 2) {
                          Get.to(() => const BlockListView());
                        } else if (index == 3) {
                          Get.to(() => const ContractsView());
                        } else if (index == 4) {
                          Get.to(() => LanguagesListView());
                        } else if (index == 5) {
                          helpLineDialog();
                        } else if (index == 7) {
                          Get.dialog(
                            AlertDialog(
                              title: UiHelpers.appText(
                                  title: 'Do you want Logout', fSize: 18),
                              content: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.5.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 4.5.h,
                                      backgroundColor: const Color(0xffFB7B7B),
                                      child: Center(
                                        child: Image.asset(
                                          FixitIcons.icLogOut,
                                          scale: .55.h,
                                        ),
                                      ),
                                    ),
                                    Sp.y(2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        UiHelpers.appText(
                                          title: 'Do you want to ',
                                          fColor: AppColors.tGrey,
                                          fSize: 14,
                                          fweight: FontWeight.w400,
                                        ),
                                        UiHelpers.appText(
                                          title: 'Logout?',
                                          fColor: AppColors.textGrey,
                                          fSize: 14,
                                        ),
                                      ],
                                    ),
                                    Sp.y(2),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          UiHelpers.appButton(
                                            onTap: () {
                                              Get.back();
                                            },
                                            bTitle: 'No',
                                            bWidth: 25,
                                            bHeight: 4.3,
                                            textSize: 15,
                                            bColor: AppColors.brown,
                                            borderColor: AppColors.brown,
                                            // tColor: AppColors.brown,
                                          ),
                                          Sp.x(1.w),
                                          UiHelpers.appButton(
                                            onTap: () {
                                              Get.offAll(
                                                  () => const SignInView());
                                            },
                                            bTitle: 'Yes',
                                            bWidth: 25,
                                            bHeight: 4.3,
                                            textSize: 15,
                                            bColor: AppColors.green,
                                            borderColor: AppColors.green,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      contentPadding: EdgeInsets.only(
                        bottom: .75.h,
                        top: .75.h,
                        left: 4.1.w,
                        right: 4.1.w,
                      ),
                      leading: CircleAvatar(
                        radius: 1.8.h,
                        backgroundColor: index == 7
                            ? const Color(0xffD04741)
                            : AppColors.primary,
                        child: const Icon(
                          CupertinoIcons.bell_fill,
                          color: AppColors.white,
                        ),
                      ),
                      title: UiHelpers.appText(
                        title: settingTileName[index],
                        tAlign: TextAlign.start,
                        fSize: 16,
                        fweight: FontWeight.w400,
                        fColor: index == 7
                            ? const Color(0xffD04741)
                            : AppColors.black,
                      ),
                      trailing: index == 1
                          ? Transform.scale(
                              scale: .07.h,
                              child: CupertinoSwitch(
                                value: isEnabled,
                                onChanged: (onChanged) {
                                  setState(() {
                                    isEnabled = !isEnabled;
                                  });
                                },
                              ),
                            )
                          : Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 2.3.h,
                              color: AppColors.black,
                            ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> helpLineDialog() {
    return Get.dialog(
      AlertDialog(
        title: UiHelpers.appText(title: 'Help Line', fSize: 18),
        content: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2.5.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 4.5.h,
                backgroundColor: const Color(0xffFB7B7B),
                child: Center(
                  child: Image.asset(
                    FixitIcons.icHelpLine,
                    scale: .55.h,
                  ),
                ),
              ),
              Sp.y(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelpers.appText(
                    title: 'Do you want to ',
                    fColor: AppColors.tGrey,
                    fSize: 14,
                    fweight: FontWeight.w400,
                  ),
                  UiHelpers.appText(
                    title: 'Call?',
                    fColor: AppColors.textGrey,
                    fSize: 14,
                  ),
                ],
              ),
              Sp.y(2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UiHelpers.appButton(
                      onTap: () {
                        Get.back();
                      },
                      bTitle: 'Cancel',
                      bWidth: 25,
                      bHeight: 4.3,
                      textSize: 15,
                      bColor: AppColors.white,
                      borderColor: AppColors.brown,
                      tColor: AppColors.brown,
                    ),
                    Sp.x(1.w),
                    UiHelpers.appButton(
                      bTitle: 'Call',
                      bWidth: 25,
                      bHeight: 4.3,
                      textSize: 15,
                      bColor: AppColors.green,
                      borderColor: AppColors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
