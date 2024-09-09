import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/icons.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/contractor_details/contractor_details.dart';
import 'package:fixit/views/create_job/create_job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            inputSection(context),
            Sp.y(3.3),
            servicesSection(),
            createJobButton(),
            Sp.y(3),
            nearMeServicesSection(),
          ],
        ),
      ),
    );
  }

  Container nearMeServicesSection() {
    return Container(
      height: 57.6.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.1.w, vertical: 2.6.h),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
        ),
      ),
      child: Column(
        children: [
          Row(children: [
            UiHelpers.appText(
              title: 'Near Me',
              fSize: 16.25,
              fweight: FontWeight.w600,
            ),
            const Spacer(),
            UiHelpers.appText(
              ontap: () {},
              title: 'View on map',
              fSize: 12.6,
              fColor: AppColors.primary,
              fweight: FontWeight.w600,
            ),
            Sp.x(3),
          ]),
          Sp.y(2),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: AppColors.primary,
                  enableFeedback: true,
                  autofocus: true,
                  onTap: () {
                    Get.to(() => const ContractorDetailsView());
                  },
                  child: Container(
                    height: 15.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.grey.withOpacity(.8))),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 11.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: AppColors.bgColor,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Image.network(
                                  profileLink,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 1.8.h,
                              width: 17.w,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17))),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: AppColors.white,
                                      size: 1.43.h,
                                    ),
                                    UiHelpers.appText(
                                        title: '4.6 (673)',
                                        fColor: AppColors.white,
                                        fSize: 11),
                                    Sp.x(2),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Sp.x(4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiHelpers.appText(
                              title: 'Dianne Russell',
                              fSize: 14.5,
                              fweight: FontWeight.w600,
                            ),
                            UiHelpers.appText(
                              title:
                                  'Loerem ipum dotot sit omet,\nconsexture odnsishs',
                              fSize: 13,
                              tAlign: TextAlign.start,
                              // fweight: FontWeight.w400,
                              fColor: AppColors.black.withOpacity(.5),
                            ),
                            // UiHelpers.appText(
                            //   title: 'Dianne Russell',
                            //   fSize: 14.5,
                            //   fweight: FontWeight.w600,
                            // ),
                            Sp.y(1),
                            UiHelpers.appText(
                              title:
                                  'Start from \$50 - 4.6Km Distance - Delivery in 15 min ',
                              fSize: 12,
                              fColor: AppColors.black.withOpacity(.8),
                            ),
                            Sp.y(1),

                            Row(
                              children: [
                                Container(
                                  height: 2.4.h,
                                  width: 20.1.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2F80ED)
                                          .withOpacity(.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: UiHelpers.appText(
                                        title: 'Extra discount',
                                        fColor: const Color(0xff2F80ED)),
                                  ),
                                ),
                                Sp.x(1.5),
                                Container(
                                  height: 2.4.h,
                                  width: 25.1.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: UiHelpers.appText(
                                        title: 'Free Home Service',
                                        fColor: AppColors.primary),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createJobButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(() => const CreateJobView());
      },
      child: Container(
        height: 5.2.h,
        width: 93.w,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.homeGrey, width: 2)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelpers.appText(
                  title: 'Create Job', fColor: AppColors.white, fSize: 17),
              Sp.x(3),
              Image.asset(
                FixitIcons.icCrJob,
                scale: .55.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox servicesSection() {
    return SizedBox(
      height: 12.6.h,
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: 4.5.w, left: 4.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 7.7.h,
                    width: 17.3.w,
                    decoration: BoxDecoration(
                      color: AppColors.homeGrey,
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Center(
                      child: Image.asset(
                        FixitIcons.icSrName,
                        scale: .53.h,
                      ),
                    ),
                  ),
                ),
                Sp.y(.5),
                Center(
                    child: UiHelpers.appText(
                  title: 'Service Name',
                  fColor: AppColors.white,
                  fSize: 12.2,
                ))
              ],
            ),
          );
        },
      ),
    );
  }

  Widget inputSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.1.w),
      child: SizedBox(
        height: 5.h,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.white.withOpacity(.5),
                    fontSize: 14.sp,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.white.withOpacity(.5),
                    size: 3.h,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 3.w,
                  ),
                  enabled: true,
                  filled: true,
                  fillColor: AppColors.homeGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            Sp.x(1.1),
            Container(
              height: 4.8.h,
              width: 10.5.w,
              decoration: BoxDecoration(
                color: AppColors.homeGrey,
                borderRadius: BorderRadius.circular(10.5),
              ),
              child: Center(
                child: Image.asset(
                  FixitIcons.icFilter,
                  scale: .5.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize homeAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        toolbarHeight: 9.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelpers.appText(
              title: 'You are here',
              fSize: 14,
              fColor: AppColors.white,
              fweight: FontWeight.w400,
              height: 1.85,
            ),
            Row(
              children: [
                UiHelpers.appText(
                  title: 'Indonesia',
                  fSize: 16,
                  fColor: AppColors.white,
                  fweight: FontWeight.w600,
                ),
                Sp.x(5),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
