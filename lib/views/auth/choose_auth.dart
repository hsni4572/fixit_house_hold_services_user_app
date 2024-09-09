// import 'package:fixit/constants/colors.dart';
// import 'package:fixit/constants/spacing.dart';
// import 'package:fixit/extensions/size_config.dart';
// import 'package:fixit/ui_helpers/ui_helpers.dart';
// import 'package:fixit/views/auth/components/social_signin.dart';
// import 'package:fixit/views/auth/sign_in.dart';
// import 'package:fixit/views/auth/sign_up.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class ChooseAuth extends StatelessWidget {
//   const ChooseAuth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 55.8.h,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                     color: AppColors.primary,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     )),
//                 child: Center(
//                   child: UiHelpers.appLogo(),
//                 ),
//               ),
//               Sp.y(8.5),
//               UiHelpers.appButton(
//                   onTap: () {
//                     Get.to(() => const SignInView());
//                   },
//                   bTitle: 'Sign In'),
//               Sp.y(2.6),
//               UiHelpers.appButton(
//                   onTap: () {
//                     Get.to(() => const SignUpView());
//                   },
//                   bTitle: 'Sign up',
//                   bColor: AppColors.grey,
//                   tColor: AppColors.black),
//               Sp.y(6.5),
//               socialSignInSection(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/auth/components/social_signin.dart';
import 'package:fixit/views/auth/sign_in.dart';
import 'package:fixit/views/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            height: 55.8.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
            child: Center(
              child: UiHelpers.appLogo(),
            ),
          ),
          Sp.y(8.5),
          UiHelpers.appButton(
              onTap: () {
                Get.to(() => const SignInView());
              },
              bTitle: 'Sign In'),
          Sp.y(2.6),
          UiHelpers.appButton(
              onTap: () {
                Get.to(() => const SignUpView());
              },
              bTitle: 'Sign up',
              bColor: AppColors.grey,
              borderColor: AppColors.grey,
              tColor: AppColors.black),
          Sp.y(6.5),
          socialSignInSection(),
        ],
      ),
    );
  }
}
