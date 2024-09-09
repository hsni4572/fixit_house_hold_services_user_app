import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/contracts/job_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContractsView extends StatelessWidget {
  const ContractsView({super.key});

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
          title: 'History',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.1.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sp.y(2),
              TabBar(
                labelPadding: EdgeInsets.only(right: 4.w),
                // indicatorPadding: EdgeInsets.only(right: 4.w),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textGrey.withOpacity(.4),
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.primary,
                  // fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textFieldColor,
                ),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.primary,
                // indicatorWeight: .0001,

                tabs: const [
                  Tab(text: 'In Progress'),
                  Tab(text: 'Completed'),
                ],
              ),
              // Expanded widget added here to make the TabBarView take the remaining space
              Expanded(
                child: TabBarView(
                  children: [
                    // IN PROGRESS TAB
                    inProgressTab(),
                    // COMPLETED TAB
                    completedTab()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView completedTab() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 2.h),
      itemCount: 8,
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: AppColors.textFieldColor.withOpacity(.8)))),
          child: Row(
            children: [
              Container(
                height: 11.5.h,
                width: 26.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.textFieldColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    profileLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Sp.x(1.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UiHelpers.appText(
                        title: 'Dianne Russell',
                        fSize: 15.5,
                        fweight: FontWeight.w600,
                        tAlign: TextAlign.start,
                      ),
                      Sp.x(17),
                      UiHelpers.appText(
                        title: 'Completed',
                        fSize: 13.5,
                        fweight: FontWeight.w600,
                        tAlign: TextAlign.end,
                        fColor: const Color(0xff31B926),
                      ),
                    ],
                  ),
                  UiHelpers.appText(
                    title: 'lorem Ipsum dotor sit amet\nconstsecture adpicing',
                    fSize: 13,
                    fweight: FontWeight.w400,
                    tAlign: TextAlign.start,
                    fColor: AppColors.textGrey,
                  ),
                  Sp.y(1),
                  Row(
                    children: [
                      UiHelpers.appText(
                        title: 'Date: ',
                        fSize: 12.5,
                        tAlign: TextAlign.start,
                      ),
                      UiHelpers.appText(
                        title: '09/07/2024',
                        fSize: 12.5,
                        tAlign: TextAlign.start,
                        fColor: AppColors.textGrey.withOpacity(.5),
                      ),
                      UiHelpers.appText(
                        title: '      •      ',
                        fSize: 12.5,
                        tAlign: TextAlign.start,
                        fColor: AppColors.textGrey.withOpacity(.5),
                      ),
                      UiHelpers.appText(
                        title: 'Total Time: ',
                        fSize: 12.5,
                        tAlign: TextAlign.start,
                      ),
                      UiHelpers.appText(
                        title: '4 Hours',
                        fSize: 12.5,
                        tAlign: TextAlign.start,
                        fColor: AppColors.textGrey.withOpacity(.5),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  ListView inProgressTab() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 2.h),
      itemCount: 8,
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => const JobDetailsView());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: AppColors.textFieldColor.withOpacity(.8)))),
            child: Row(
              children: [
                Container(
                  height: 11.5.h,
                  width: 26.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.textFieldColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      profileLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Sp.x(1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        UiHelpers.appText(
                          title: 'Dianne Russell',
                          fSize: 15.5,
                          fweight: FontWeight.w600,
                          tAlign: TextAlign.start,
                        ),
                        Sp.x(17),
                        UiHelpers.appText(
                          title: 'In Progress',
                          fSize: 13.5,
                          fweight: FontWeight.w600,
                          tAlign: TextAlign.end,
                          fColor: AppColors.primary,
                        ),
                      ],
                    ),
                    UiHelpers.appText(
                      title:
                          'lorem Ipsum dotor sit amet\nconstsecture adpicing',
                      fSize: 13,
                      fweight: FontWeight.w400,
                      tAlign: TextAlign.start,
                      fColor: AppColors.textGrey,
                    ),
                    Sp.y(1),
                    Row(
                      children: [
                        UiHelpers.appText(
                          title: 'Date: ',
                          fSize: 12.5,
                          tAlign: TextAlign.start,
                        ),
                        UiHelpers.appText(
                          title: '09/07/2024',
                          fSize: 12.5,
                          tAlign: TextAlign.start,
                          fColor: AppColors.textGrey.withOpacity(.5),
                        ),
                        UiHelpers.appText(
                          title: '      •      ',
                          fSize: 12.5,
                          tAlign: TextAlign.start,
                          fColor: AppColors.textGrey.withOpacity(.5),
                        ),
                        UiHelpers.appText(
                          title: 'Total Time: ',
                          fSize: 12.5,
                          tAlign: TextAlign.start,
                        ),
                        UiHelpers.appText(
                          title: '4 Hours',
                          fSize: 12.5,
                          tAlign: TextAlign.start,
                          fColor: AppColors.textGrey.withOpacity(.5),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
