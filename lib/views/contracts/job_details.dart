import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/contracts/bid_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: UiHelpers.backButton(),
        centerTitle: true,
        title: UiHelpers.appText(
          title: 'Job Details Screen',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sp.y(3),
            jobStatusDetailsSection(),
            Sp.y(1.5),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelpers.appText(
                  title: 'Pictures',
                  fSize: 17,
                  fweight: FontWeight.w600,
                ),
                Sp.y(1.5),
                Row(
                  children: [
                    imageVideoContainer(),
                    imageVideoContainer(),
                    imageVideoContainer(),
                  ],
                )
              ],
            )),
            Sp.y(1.5),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelpers.appText(
                  title: 'Videos',
                  fSize: 17,
                  fweight: FontWeight.w600,
                ),
                Sp.y(1.5),
                Row(
                  children: [
                    imageVideoContainer(),
                    imageVideoContainer(),
                    imageVideoContainer(),
                  ],
                )
              ],
            )),
            Sp.y(2.5),
            UiHelpers.appText(
              title: 'Description',
              fSize: 17,
              fweight: FontWeight.w600,
            ),
            Sp.y(.5),
            UiHelpers.appText(
                maxLine: 10,
                height: .24.h,
                tAlign: TextAlign.start,
                title:
                    'Your payment method may temporarily show a hold in the amount of \$15 per hour, which is the rate of your Tasker. You have the option to cancel anytime. However, cancellations made less than 24 hours before the scheduled start time may incur a cancellation fee equivalent to one hour of service. Please note that all tasks have a minimum of one hour charge.',
                fSize: 13.6,
                fweight: FontWeight.w600,
                fColor: AppColors.textGrey.withOpacity(.5)),
            const Spacer(),
            UiHelpers.appButton(
              onTap: () {
                Get.to(() => const BidHistoryView());
              },
              bTitle: 'View Offers',
              bColor: AppColors.white,
              tColor: AppColors.primary,
            ),
            Sp.y(2),
          ],
        ),
      ),
    );
  }

  Container imageVideoContainer() {
    return Container(
      margin: EdgeInsets.only(right: 2.2.w),
      padding: EdgeInsets.all(.1.h),
      height: 9.5.h,
      width: 22.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          profileLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  SizedBox jobStatusDetailsSection() {
    return SizedBox(
      // height: 12.h,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiHelpers.appText(
                title: 'Job Title',
                fSize: 17,
                fweight: FontWeight.w600,
              ),
              Sp.y(.85),
              UiHelpers.appButton(
                bTitle: 'Category',
                bHeight: 3.1,
                bWidth: 18,
                textSize: 13.5,
                bColor: AppColors.primary.withOpacity(.2),
                borderColor: Colors.transparent,
                tColor: AppColors.primary,
              ),
              Sp.y(1),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 2.2.h,
                  ),
                  Sp.x(2),
                  UiHelpers.appText(
                    title: 'Current Location',
                    fSize: 13,
                    fweight: FontWeight.w600,
                  )
                ],
              ),
              Sp.y(1.5),
              Row(
                children: [
                  UiHelpers.appText(
                    title: 'Status:',
                    fSize: 13.5,
                  ),
                  Sp.x(3.5),
                  UiHelpers.appText(
                    title: 'Instant',
                    fSize: 13.5,
                    fColor: AppColors.primary,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 4.h,
                backgroundImage: const NetworkImage(profileLink),
              ),
              Sp.y(.65),
              UiHelpers.appText(
                title: 'Dianne Russell',
                fSize: 15,
                fColor: AppColors.textGrey.withOpacity(.5),
                fweight: FontWeight.w600,
              ),
              Sp.y(.65),
              UiHelpers.appText(
                title: 'View User',
                fSize: 15,
                fColor: AppColors.primary,
                decoration: TextDecoration.underline,
                fweight: FontWeight.w600,
              ),
            ],
          )
        ],
      ),
    );
  }
}
