import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/spacing.dart';

class BidHistoryView extends StatelessWidget {
  const BidHistoryView({super.key});

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
          title: 'Bid History',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: AppColors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    height: 20.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: AppColors.textFieldColor,
                    ))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Transform.scale(
                            scale: .15.h,
                            child: CircleAvatar(
                              maxRadius: 4.h,
                              backgroundImage: NetworkImage(profileLink),
                            ),
                          ),
                          title: UiHelpers.appText(
                            title: 'Greg Hegmann',
                            fSize: 16,
                            fweight: FontWeight.w600,
                            tAlign: TextAlign.start,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Sp.y(.5),
                              UiHelpers.appText(
                                title: 'Admin@gmail.com',
                                fColor: AppColors.tGrey,
                                fSize: 14,
                                tAlign: TextAlign.start,
                              ),
                              Sp.y(1),
                              UiHelpers.appText(
                                title: '⭐⭐⭐⭐⭐',
                                fColor: AppColors.tGrey,
                                fSize: 14,
                                tAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          trailing: UiHelpers.appText(
                            height: 0,
                            title: '\$600',
                            fSize: 19,
                            fweight: FontWeight.w600,
                            fColor: AppColors.primary,
                          ),
                        ),
                        Sp.y(1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelpers.appButton(
                              bTitle: 'Call',
                              bHeight: 4.1,
                              bWidth: 42.2,
                              textSize: 14,
                              isCallMsgBtn: true,
                              icon: Icons.call,
                            ),
                            UiHelpers.appButton(
                              bTitle: 'Message',
                              bHeight: 4.1,
                              bWidth: 42.2,
                              textSize: 14,
                              isCallMsgBtn: true,
                              icon: CupertinoIcons.chat_bubble_text_fill,
                            ),
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
      ),
    );
  }
}
