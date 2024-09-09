import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: UiHelpers.appText(title: 'Notifications', fSize: 17),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w500),
                children: const [
                  TextSpan(
                    text: 'You have ',
                    style: TextStyle(color: AppColors.black),
                  ),
                  TextSpan(
                    text: '4 notification ',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  TextSpan(
                    text: 'today',
                    style: TextStyle(color: AppColors.black),
                  ),
                ],
              ),
            ),
            Sp.y(4),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                        radius: 2.7.h,
                        backgroundImage: const NetworkImage(profileLink)),
                    title: UiHelpers.appText(
                      title: 'Kevin.eth',
                      fSize: 16,
                      tAlign: TextAlign.start,
                      fweight: FontWeight.w400,
                    ),
                    subtitle: UiHelpers.appText(
                      title:
                          'Lorem ipsum dolor sit amet, consectetur, aciping....',
                      fSize: 14,
                      tAlign: TextAlign.start,
                      fweight: FontWeight.w400,
                      fColor: AppColors.tGrey,
                    ),
                    trailing: UiHelpers.appText(
                      title: '14:28',
                      fSize: 14,
                      tAlign: TextAlign.start,
                      fColor: AppColors.tGrey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
