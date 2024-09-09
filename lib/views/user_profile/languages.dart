// import 'package:fixit/constants/colors.dart';
// import 'package:fixit/constants/spacing.dart';
// import 'package:fixit/ui_helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// // ignore: must_be_immutable
// class LanguagesListView extends StatefulWidget {
//   LanguagesListView({super.key});

//   @override
//   State<LanguagesListView> createState() => _LanguagesListViewState();
// }

// class _LanguagesListViewState extends State<LanguagesListView> {
//   List<String> lName = [
//     'English',
//     'Urdu',
//     'German',
//     'USA',
//   ];

//   bool isTapped = false;

//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         centerTitle: true,
//         leading: UiHelpers.backButton(),
//         title: UiHelpers.appText(
//           title: 'Block List',
//           fSize: 16.8,
//           fweight: FontWeight.w600,
//         ),
//       ),
//       body: Column(
//         children: [
//           Sp.y(2),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 4,
//               shrinkWrap: false,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                     color: index == 0
//                         ? AppColors.textGrey.withOpacity(.15)
//                         : Colors.white,
//                     width: .5,
//                   ))),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         onTap: () {
//                           setState(() {
//                             isTapped = !isTapped;
//                             index = selectedIndex;
//                           });
//                         },
//                         leading: CircleAvatar(
//                           radius: 1.8.h,
//                         ),
//                         title: UiHelpers.appText(
//                           title: lName[index],
//                           fSize: 16,
//                           tAlign: TextAlign.start,
//                           fweight: FontWeight.w400,
//                         ),
//                         trailing: CircleAvatar(
//                           backgroundColor: selectedIndex == index
//                               ? AppColors.primary
//                               : AppColors.white,
//                           radius: 1.4.h,
//                           child: Center(
//                             child: Icon(
//                               Icons.done_rounded,
//                               color: isTapped
//                                   ? AppColors.white
//                                   : const Color(0xffCCCCCC),
//                               size: 1.9.h,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/controllers/select_language_controller.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguagesListView extends StatelessWidget {
  LanguagesListView({super.key});

  final LanguagesController langController = Get.put(LanguagesController());

  final List<String> lName = [
    'English',
    'Urdu',
    'German',
    'USA',
  ];

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
          title: 'Languages',
          fSize: 16.8,
          fweight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Sp.y(2),
          Expanded(
            child: ListView.builder(
              itemCount: lName.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == 0
                              ? AppColors.textGrey.withOpacity(.15)
                              : Colors.white,
                          width: .5,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            langController.updateIndex(index);
                          },
                          leading: CircleAvatar(
                            radius: 1.8.h,
                          ),
                          title: UiHelpers.appText(
                            title: lName[index],
                            fSize: 16,
                            tAlign: TextAlign.start,
                            fweight: FontWeight.w400,
                          ),
                          trailing: CircleAvatar(
                            backgroundColor:
                                langController.selectedIndex.value == index
                                    ? AppColors.primary
                                    : AppColors.white,
                            radius: 1.4.h,
                            child: Center(
                              child: Icon(
                                Icons.done_rounded,
                                color:
                                    langController.selectedIndex.value == index
                                        ? AppColors.white
                                        : const Color(0xffCCCCCC),
                                size: 1.9.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
