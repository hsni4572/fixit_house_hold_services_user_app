import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContractorDetailsView extends StatelessWidget {
  const ContractorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        leading: UiHelpers.backButton(),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: UiHelpers.appText(title: 'Contractor Details', fSize: 17),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: Column(
          children: [
            contractorProfileDetails(),
            Sp.y(1.4),
            UiHelpers.appButton(bTitle: 'Hire Me'),
            Sp.y(1.5),
            UiHelpers.appButton(
              bTitle: 'Give Feedback',
              bColor: AppColors.white,
              tColor: AppColors.primary,
            ),
            Sp.y(1.4),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      isScrollable: false,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: const Color(0xff494B50),
                      labelStyle: TextStyle(
                        fontSize: 14.5.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.primary,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.5.sp,
                        color: const Color(0xff494B50),
                      ),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.primary,
                      indicatorWeight: 1.5,
                      tabs: const [
                        Tab(text: 'About'),
                        Tab(text: 'Portfolio'),
                        Tab(text: 'Reviews'),
                      ],
                    ),
                    // Expanded widget added here to make the TabBarView take the remaining space
                    Expanded(
                      child: TabBarView(
                        children: [
                          // ABOUT TAB
                          aboutTab(),
                          // PORTFOLIO TAB
                          portfolioTab(),
                          // REVIEWS TAB
                          reviewsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container reviewsTab() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.65.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiHelpers.appText(
            title: 'Reviews',
            fweight: FontWeight.w600,
            fSize: 16.2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 13.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.grey.withOpacity(.8)))),
                  child: Column(
                    children: [
                      ListTile(
                        // onTap: () {},
                        contentPadding: const EdgeInsets.all(0),
                        splashColor: AppColors.homeGrey,
                        leading: const CircleAvatar(),
                        title: UiHelpers.appText(
                          title: 'Jinny Oslin',
                          fSize: 14.7,
                          fweight: FontWeight.w600,
                          tAlign: TextAlign.start,
                        ),
                        subtitle: UiHelpers.appText(
                          title: 'A day ago',
                          fSize: 13,
                          tAlign: TextAlign.start,
                          fColor: AppColors.textGrey,
                        ),
                        trailing: const Text('⭐⭐⭐⭐⭐'),
                      ),
                      UiHelpers.appText(
                        title:
                            'I highly recommend Dianne for any plumbing needs, he truly is an expert in his field',
                        tAlign: TextAlign.start,
                        fweight: FontWeight.w400,
                        fColor: AppColors.textGrey,
                        fSize: 13,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget portfolioTab() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.65.h),
      child: Column(
        children: [
          Row(
            children: [
              UiHelpers.appText(
                title: 'Recent Projects',
                fweight: FontWeight.w600,
                fSize: 17,
              ),
              const Spacer(),
              UiHelpers.appText(
                title: 'View All',
                fColor: const Color(0xff6750A4),
                fSize: 12.5,
              ),
            ],
          ),
          Sp.y(1.5),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 2.h,
              ),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 12.h,
                        child: Image.network(
                          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Sp.y(1),
                    UiHelpers.appText(
                      title: 'Local Restraurant',
                      fSize: 15,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container aboutTab() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.65.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiHelpers.appText(
            title: 'Skill and Experience',
            fweight: FontWeight.w600,
            fSize: 17,
          ),
          Sp.y(1),
          UiHelpers.appText(
            title:
                'Dianne Russell is a skilled and experienced male plumber. He has extensive knowledge in installing and maintaining plumbing systems for potable water, sewage and drainage.He is known for his attention to detail and ability to solve even the most complex plumbing issues.',
            tAlign: TextAlign.start,
            fSize: 14,
            fColor: const Color(0xff494B50),
            fweight: FontWeight.w400,
          ),
          Sp.y(3),
          UiHelpers.appText(
            title: 'Skills',
            fweight: FontWeight.w600,
            fSize: 17,
          ),
          Sp.y(1),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 6 / 2,
                crossAxisSpacing: 2.6.w,
                mainAxisSpacing: 1.2.h,
              ),
              itemCount: 7,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return skillNameCont();
              },
            ),
          )
        ],
      ),
    );
  }

  Container skillNameCont() {
    return Container(
      height: 3.h,
      width: 15.w,
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
          child: UiHelpers.appText(
        title: 'Skil no. 1',
        fColor: AppColors.primary,
        fSize: 13.5,
      )),
    );
  }

  Row contractorProfileDetails() {
    return Row(
      children: [
        Container(
          height: 18.h,
          width: 33.w,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Sp.x(3),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelpers.appText(
              title: 'Dianne Russell',
              fSize: 18,
              fweight: FontWeight.w600,
            ),
            Sp.y(.4),
            UiHelpers.appText(
              title: 'Plumber',
              fSize: 15,
              fColor: AppColors.textGrey,
              fweight: FontWeight.w400,
            ),
            Sp.y(.7),
            UiHelpers.appText(
              title: '7\$/hour',
              fSize: 15,
              fweight: FontWeight.w600,
              fColor: const Color(0xff0F6C8A),
            ),
            Sp.y(1),
            Row(
              children: [
                Container(
                  height: 8.h,
                  width: 27.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFFBFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UiHelpers.appText(
                          title: 'Rating',
                          fSize: 14,
                          fweight: FontWeight.w400,
                        ),
                        UiHelpers.appText(
                          title: '4.5',
                          fweight: FontWeight.w600,
                          fSize: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                Sp.x(1.5),
                Container(
                  height: 8.h,
                  width: 27.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFFBFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UiHelpers.appText(
                          title: 'Project',
                          fSize: 14,
                          fweight: FontWeight.w400,
                        ),
                        UiHelpers.appText(
                          title: '50',
                          fweight: FontWeight.w600,
                          fSize: 15,
                        ),
                        Icon(
                          Icons.folder_outlined,
                          size: 1.55.h,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
