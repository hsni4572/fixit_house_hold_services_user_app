import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UiHelpers {
  static IconButton backButton() {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 1.9.h,
        color: AppColors.black,
      ),
    );
  }

  static Image appLogo({
    Color color = AppColors.white,
    double size = .68,
  }) {
    return Image.asset(
      'assets/logos/app logo.png',
      scale: size.h,
      color: color,
    );
  }

  static Widget appButton({
    required String bTitle,
    Color bColor = AppColors.primary,
    Color tColor = AppColors.white,
    Function()? onTap,
    Color borderColor = AppColors.primary,
    double bWidth = 93,
    double bHeight = 5.2,
    double textSize = 17,
    bool isCallMsgBtn = false,
    IconData? icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: bHeight.h,
        width: bWidth.w,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: bColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appText(title: bTitle, fColor: tColor, fSize: textSize),
              isCallMsgBtn
                  ? Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Icon(
                        icon,
                        color: AppColors.white,
                        size: 1.8.h,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget appText(
      {required String title,
      FontWeight fweight = FontWeight.w500,
      Color fColor = AppColors.black,
      double fSize = 12,
      TextAlign tAlign = TextAlign.center,
      Function()? ontap,
      double? height,
      int maxLine = 1,
      TextDecoration? decoration = TextDecoration.none}) {
    return InkWell(
      onTap: ontap,
      child: Text(
        maxLines: maxLine,
        title,
        style: TextStyle(
            decoration: decoration,
            letterSpacing: .005.w,
            fontFamily: 'Poppins',
            fontWeight: fweight,
            color: fColor,
            fontSize: fSize.sp,
            height: height),
        textAlign: tAlign,
      ),
    );
  }

  // static TextFormField inputField({
  //   required BuildContext context,
  //   required String label,
  //   double padding = .9,
  //   bool hideText = false,
  // }) {
  //   return TextFormField(
  //     obscureText: hideText,
  //     onTapOutside: (event) => FocusScope.of(context).unfocus(),
  //     decoration: InputDecoration(
  //       isDense: true,
  //       hintText: label,
  //       hintStyle:
  //           TextStyle(color: AppColors.black.withOpacity(.3), fontSize: 14.sp),
  //       contentPadding:
  //           EdgeInsets.symmetric(vertical: padding.h, horizontal: 3.w),
  //       enabled: true,
  //       filled: true,
  //       fillColor: AppColors.textFieldColor,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(9),
  //         borderSide: const BorderSide(
  //           color: AppColors.textFieldColor,
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(9),
  //         borderSide: const BorderSide(
  //           color: AppColors.primary,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Widget customDropdownField({
    required String hintText,
    required List<String> items,
    String? selectedValue,
    required ValueChanged<String?> onChanged,
    bool isSearchField = false,
    bool isPasswordField = false,
    bool hideText = false,
  }) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      alignment: Alignment.topCenter,
      decoration: InputDecoration(
        // isCollapsed: true,
        isDense: true,
        // hintText: hintText,

        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(.3),
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: .7.h,
          horizontal: 3.w,
        ),
        enabled: true,
        filled: true,
        fillColor: AppColors.textFieldColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.textFieldColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.textFieldColor,
          ),
        ),
      ),
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  static Widget inputField({
    required BuildContext context,
    required String label,
    double padding = 1.9,
    bool hideText = false,
    bool isPasswordField = false,
    bool isSearchField = false,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        void _togglePasswordVisibility() {
          setState(() {
            hideText = !hideText;
          });
        }

        return TextFormField(
            obscureText: hideText,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              isDense: true,
              hintText: label,
              hintStyle: TextStyle(
                color: AppColors.black.withOpacity(.3),
                fontSize: 14.sp,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: padding.h,
                horizontal: 3.w,
              ),
              enabled: true,
              filled: true,
              fillColor: AppColors.textFieldColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(
                  color: AppColors.textFieldColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              prefixIcon: isSearchField
                  ? Image.asset(
                      FixitIcons.icSearch,
                      scale: .55.h,
                    )
                  : null,
              suffixIcon: isPasswordField
                  ? GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        size: 1.8.h,
                        hideText ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xffC0C0C0),
                      ),
                    )
                  : null,
            ));
      },
    );
  }
}
