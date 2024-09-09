import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlockListView extends StatelessWidget {
  const BlockListView({super.key});

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
          title: 'Block List',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Sp.y(2),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: index == 0
                        ? AppColors.textGrey.withOpacity(.15)
                        : Colors.white,
                    width: .5,
                  ))),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ListTile(
                            title: UiHelpers.appText(
                              title: 'Kurt Gurbig',
                              fSize: 16,
                              tAlign: TextAlign.start,
                              fweight: FontWeight.w600,
                            ),
                            // EMAIL TEXT
                            subtitle: UiHelpers.appText(
                              tAlign: TextAlign.start,
                              title: 'danyal@gmail.com',
                              fweight: FontWeight.w400,
                              fSize: 14.8,
                              fColor: const Color(0xff8593A8),
                            ),
                          ),
                          Positioned(
                            right: 5.w,
                            bottom: 2.8.h,
                            top: 2.8.h,
                            child: Container(
                              height: 2.4.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: UiHelpers.appText(
                                  title: 'unblock',
                                  fColor: AppColors.white,
                                  fweight: FontWeight.w400,
                                  fSize: 13.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
}
