import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/image_address.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/messages_chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: UiHelpers.appText(
          title: 'Messages',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.1.w),
        child: Column(
          children: [
            Sp.y(2),
            UiHelpers.inputField(
              context: context,
              label: 'Type text here...',
              padding: 1,
              isSearchField: true,
            ),
            Sp.y(2),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColors.textFieldColor))),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const ChatView());
                      },
                      leading: CircleAvatar(
                        radius: 3.h,
                        backgroundImage: const NetworkImage(profileLink),
                      ),
                      title: UiHelpers.appText(
                        title: 'Kurt Gurbig',
                        fSize: 16,
                        tAlign: TextAlign.start,
                        fweight: FontWeight.w600,
                      ),
                      subtitle: UiHelpers.appText(
                        title: 'Kurt is typing....',
                        fSize: 14,
                        tAlign: TextAlign.start,
                        fweight: FontWeight.w400,
                        fColor: AppColors.tGrey,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiHelpers.appText(
                            title: '14:28',
                            fSize: 14,
                            tAlign: TextAlign.start,
                            fColor: AppColors.tGrey,
                          ),
                          CircleAvatar(
                            backgroundColor: const Color(0xffFB7B7B),
                            radius: 1.h,
                            child: Center(
                              child: UiHelpers.appText(
                                  title: '1', fColor: AppColors.white),
                            ),
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
      ),
    );
  }
}
