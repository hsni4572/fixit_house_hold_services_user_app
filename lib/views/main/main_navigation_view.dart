import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/icons.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/views/home/home.dart';
import 'package:fixit/views/messages_chat/messages.dart';
import 'package:fixit/views/notifications/notifications.dart';
import 'package:fixit/views/contracts/contracts.dart';
import 'package:fixit/views/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  final List<Widget> _pages = [
    const HomeView(),
    const MessagesView(),
    const NotificationsView(),
    const UserProfileView(),
  ];

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: AppColors.textGrey.withOpacity(.3),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            backgroundColor: Colors.white,
            elevation: 0,
            enableFeedback: false,
            selectedLabelStyle: TextStyle(
                color: AppColors.primary,
                fontFamily: 'Poppins',
                fontSize: 12.sp),
            useLegacyColorScheme: false,
            currentIndex: _currentIndex, // Highlight the current tab
            onTap: _onTabTapped, // Handle tab selection
            items: [
              BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Image.asset(
                        FixitIcons.icHomeFill,
                        scale: .5.h,
                      )
                    : Image.asset(
                        FixitIcons.icHome,
                        scale: .5.h,
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? Image.asset(
                        FixitIcons.icMsgFill,
                        scale: .5.h,
                      )
                    : Image.asset(
                        FixitIcons.icChat,
                        scale: .5.h,
                      ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? Image.asset(
                        FixitIcons.icBellFill,
                        scale: .5.h,
                      )
                    : Image.asset(
                        FixitIcons.icNotification,
                        scale: .5.h,
                      ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? Image.asset(
                        FixitIcons.icProfileFill,
                        scale: .5.h,
                      )
                    : Image.asset(
                        FixitIcons.icProfile,
                        scale: .5.h,
                      ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
